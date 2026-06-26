function [tau, v, s, info] = calc_PTSMC_tau( ...
    LP, SV, q_D, q_D_dot, q_D_dot_dot, q_A, q_A_dot, params)
%CALC_PTSMC_TAU_0625 Predefined-time nonsingular SMC torque.
%
% Robot dynamics:
%   M(q) qdd + C(q,qd) + G(q) = tau
%
% This function maps the predefined-time nonsingular SMC law from the
% second-order form to a computed-torque acceleration command:
%   tau = M(q) v + C(q,qd) + G(q)
%
% The tracking error follows the paper convention:
%   e  = q_A - q_D
%   ed = q_A_dot - q_D_dot

if nargin < 8 || isempty(params)
    params = struct();
end

q_D         = as_column(q_D, 'q_D');
q_D_dot     = as_column(q_D_dot, 'q_D_dot');
q_D_dot_dot = as_column(q_D_dot_dot, 'q_D_dot_dot');
q_A         = as_column(q_A, 'q_A');
q_A_dot     = as_column(q_A_dot, 'q_A_dot');

n = numel(q_A);
if any([numel(q_D), numel(q_D_dot), numel(q_D_dot_dot), numel(q_A_dot)] ~= n)
    error('calc_PTSMC_tau_0625:SizeMismatch', ...
        'All joint state vectors must have the same length.');
end

p = resolve_params(params, n);

e  = q_A - q_D;
ed = q_A_dot - q_D_dot;

b1 = pi ./ (p.Alpha .* p.T1);
b2 = pi ./ (p.Alpha .* p.Mu1 .* p.T1) .* ...
    p.P1 ./ sqrt(p.P1 .* p.Q1) .* ...
    (0.5).^(1 - p.Alpha ./ 2);
b3 = pi .* p.Mu1 ./ (p.Alpha .* p.T1) .* ...
    p.Q1 ./ sqrt(p.P1 .* p.Q1) .* ...
    (0.5).^(1 + p.Alpha ./ 2);

k1 = pi ./ (p.Beta .* p.T2);
k2 = pi ./ (p.Beta .* p.Mu2 .* p.T2) .* ...
    p.P2 ./ sqrt(p.P2 .* p.Q2) .* ...
    (0.5).^(1 - p.Beta ./ 2);
k3 = pi .* p.Mu2 ./ (p.Beta .* p.T2) .* ...
    p.Q2 ./ sqrt(p.P2 .* p.Q2) .* ...
    (0.5).^(1 + p.Beta ./ 2);

s = ed + b1 .* e + signed_power(e, 1 - p.Alpha) .* b2 + ...
    signed_power(e, 1 + p.Alpha) .* b3;

abs_e_safe = max(abs(e), p.ErrorEpsilon);
singular_raw = b2 .* (1 - p.Alpha) .* abs_e_safe.^(-p.Alpha) .* ed;
singular_term = sat_limit(singular_raw, p.H);

equivalent_term = b1 .* ed + singular_term + ...
    b3 .* (1 + p.Alpha) .* abs(e).^p.Alpha .* ed;

sign_s = switching_sign(s, p);
switching_term = k1 .* s + ...
    k2 .* abs(s).^(1 - p.Beta) .* sign_s + ...
    k3 .* abs(s).^(1 + p.Beta) .* sign_s + ...
    p.K .* sign_s;

v = q_D_dot_dot - equivalent_term - switching_term;
v = apply_limit(v, p.AccelerationLimit);

[M_ctrl, C_ctrl, G_ctrl] = compute_dynamics(LP, SV, q_A, q_A_dot, p);
tau = M_ctrl * v + C_ctrl(:) + G_ctrl(:);
tau = apply_limit(tau, p.TorqueLimit);

if nargout > 3
    info = struct();
    info.e = e;
    info.ed = ed;
    info.s = s;
    info.v = v;
    info.equivalent_term = equivalent_term;
    info.switching_term = switching_term;
    info.params = p;
end
end

function x = as_column(x, name)
x = x(:);
if ~isnumeric(x) || any(~isfinite(x))
    error('calc_PTSMC_tau_0625:BadInput', ...
        '%s must be a finite numeric vector.', name);
end
end

function y = signed_power(x, power_value)
y = abs(x).^power_value .* sign(x);
end

function y = sat_limit(x, limit_value)
limit_value = abs(limit_value);
y = min(abs(x), limit_value) .* sign(x);
end

function y = switching_sign(s, p)
if p.UseSmoothSign
    y = tanh(0.5 .* p.Rho .* s);
else
    y = sign(s);
end
end

function y = apply_limit(x, limit_value)
if isempty(limit_value)
    y = x;
    return;
end
limit_value = abs(limit_value);
y = min(max(x, -limit_value), limit_value);
end

function [M_ctrl, C_ctrl, G_ctrl] = compute_dynamics(LP, SV, q_A, q_A_dot, p)
persistent mex_available
if isempty(mex_available)
    mex_available = p.UseMex;
end

if p.UseMex && mex_available
    try
        [M_ctrl, C_ctrl, G_ctrl] = calc_MCG_0625_mex(LP, SV, q_A, q_A_dot);
        return;
    catch ME
        if ~p.FallbackToMFile
            rethrow(ME);
        end
        mex_available = false;
        warning('calc_PTSMC_tau_0625:MexFallback', ...
            ['calc_MCG_0625_mex failed for the current LP/SV size. ', ...
            'Falling back to calc_MCG_0625. Original error: %s'], ME.message);
    end
end

[M_ctrl, C_ctrl, G_ctrl] = calc_MCG_0625(LP, SV, q_A, q_A_dot);
end

function p = resolve_params(params, n)
p = struct();
p.Alpha = get_vector_param(params, 'Alpha', 0.5, n, true);
p.Beta = get_vector_param(params, 'Beta', 0.5, n, true);
p.T1 = get_vector_param(params, 'T1', 1.5, n, true);
p.T2 = get_vector_param(params, 'T2', 1.0, n, true);
p.P1 = get_vector_param(params, 'P1', 1.0, n, true);
p.Q1 = get_vector_param(params, 'Q1', 1.0, n, true);
p.Mu1 = get_vector_param(params, 'Mu1', 1.0, n, true);
p.P2 = get_vector_param(params, 'P2', 1.0, n, true);
p.Q2 = get_vector_param(params, 'Q2', 1.0, n, true);
p.Mu2 = get_vector_param(params, 'Mu2', 1.0, n, true);
p.H = get_vector_param(params, 'H', 50.0, n, true);
p.K = get_vector_param(params, 'K', 0.0, n, false);
p.Rho = get_vector_param(params, 'Rho', 50.0, n, true);
p.ErrorEpsilon = get_vector_param(params, 'ErrorEpsilon', 1e-8, n, true);
p.TorqueLimit = get_optional_limit(params, 'TorqueLimit', n);
p.AccelerationLimit = get_optional_limit(params, 'AccelerationLimit', n);
p.UseSmoothSign = get_bool_param(params, 'UseSmoothSign', true);
p.UseMex = get_bool_param(params, 'UseMex', true);
p.FallbackToMFile = get_bool_param(params, 'FallbackToMFile', true);

if any(p.Alpha <= 0 | p.Alpha >= 1)
    error('calc_PTSMC_tau_0625:BadAlpha', ...
        'Alpha must satisfy 0 < Alpha < 1.');
end
if any(p.Beta <= 0 | p.Beta >= 1)
    error('calc_PTSMC_tau_0625:BadBeta', ...
        'Beta must satisfy 0 < Beta < 1.');
end
end

function value = get_vector_param(params, name, default_value, n, must_be_positive)
if isfield(params, name) && ~isempty(params.(name))
    value = params.(name);
else
    value = default_value;
end
value = value(:);
if isscalar(value)
    value = repmat(value, n, 1);
elseif numel(value) ~= n
    error('calc_PTSMC_tau_0625:BadParamSize', ...
        '%s must be scalar or a %d-element vector.', name, n);
end
if ~isnumeric(value) || any(~isfinite(value))
    error('calc_PTSMC_tau_0625:BadParamValue', ...
        '%s must be finite and numeric.', name);
end
if must_be_positive && any(value <= 0)
    error('calc_PTSMC_tau_0625:BadParamValue', ...
        '%s must be positive.', name);
end
end

function value = get_optional_limit(params, name, n)
if ~isfield(params, name) || isempty(params.(name))
    value = [];
    return;
end
value = get_vector_param(params, name, [], n, true);
end

function value = get_bool_param(params, name, default_value)
if isfield(params, name) && ~isempty(params.(name))
    value = logical(params.(name));
else
    value = default_value;
end
if ~isscalar(value)
    error('calc_PTSMC_tau_0625:BadParamValue', ...
        '%s must be scalar logical.', name);
end
end
