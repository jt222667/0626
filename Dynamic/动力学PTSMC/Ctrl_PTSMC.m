function [sys,x0,str,ts] = Ctrl_PTSMC(t,x,u,flag)
%CHAP2_1CTRL 7 自由度关节空间 computed-torque PD 控制器

switch flag
    case 0
        [sys,x0,str,ts] = mdlInitializeSizes;
    case 3
        sys = mdlOutputs(t,u);
    case {1,2,4,9}
        sys = [];
    otherwise
        error(['Unhandled flag = ', num2str(flag)]);
end
end

function [sys,x0,str,ts] = mdlInitializeSizes
addpath(fileparts(mfilename('fullpath')), '-begin');
get_model_data(true);
get_ptsmc_params(true);
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 28;
sizes.NumInputs      = 14;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [0 0];
end

%%
function sys = mdlOutputs(t,u)
[LP, SV] = get_model_data(false);
q_D = zeros(7,1);
q_D_dot = zeros(7,1);
q_D_dot_dot = zeros(7,1);
q_A   = u(1:7);       % 实际关节位置
q_A_dot  = u(8:14);   % 实际关节速度

CHOSEN = 1

A = pi/2;
q_D(CHOSEN) = A *sin(t);
q_D_dot(CHOSEN) = A *cos(t);
q_D_dot_dot(CHOSEN) = -A *sin(t);


A = pi/2;
q_D(2) = A *sin(t);
q_D_dot(2) = A *cos(t);
q_D_dot_dot(2) = -A *sin(t);

q_D(3) = A *sin(t);
q_D_dot(3) = A *cos(t);
q_D_dot_dot(3) = -A *sin(t);

q_D(4) = A *sin(t);
q_D_dot(4) = A *cos(t);
q_D_dot_dot(4) = -A *sin(t);

q_D(5) = A *sin(t);
q_D_dot(5) = A *cos(t);
q_D_dot_dot(5) = -A *sin(t);

q_D(6) = A *sin(t);
q_D_dot(6) = A *cos(t);
q_D_dot_dot(6) = -A *sin(t);

ptsmc_params = get_ptsmc_params(false);
tau = calc_PTSMC_tau( ...
    LP, SV, q_D, q_D_dot, q_D_dot_dot, q_A, q_A_dot, ptsmc_params);
sys = [tau(:); q_D(:); q_D_dot(:); q_D_dot_dot(:)];
end


%% 辅助函数
function [LP, SV] = get_model_data(reset)
persistent LP_cache SV_cache
if reset
    LP_cache = [];
    SV_cache = [];
end
if isempty(LP_cache)
    LP_cache = evalin('base', 'LP');
    SV_cache = evalin('base', 'SV');
end
LP = LP_cache;
SV = SV_cache;
end

function params = get_ptsmc_params(reset)
persistent params_cache
if reset
    params_cache = [];
end
if isempty(params_cache)
    if evalin('base', 'exist(''PTSMC_0625'',''var'')')
        params_cache = evalin('base', 'PTSMC_0625');
    else
        params_cache = struct();
    end
end
params = params_cache;
end
