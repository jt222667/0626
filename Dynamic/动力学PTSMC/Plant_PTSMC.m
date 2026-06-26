function [sys,x0,str,ts] = Plant_PTSMC(t,x,u,flag)
%CHAP2_1PLANT 7 自由度机器人动力学被控对象
% 状态 x = [q; qd]，输入 u = tau。
% 动力学方程：M(q)qdd + C(q,qd)qd + G(q) = tau。

switch flag
    case 0
        [sys,x0,str,ts] = mdlInitializeSizes;
    case 1
        sys = mdlDerivatives(x,u);
    case 3
        sys = mdlOutputs(x);
    case {2,4,9}
        sys = [];
    otherwise
        error(['Unhandled flag = ', num2str(flag)]);
end
end

function [sys,x0,str,ts] = mdlInitializeSizes
addpath(fileparts(mfilename('fullpath')), '-begin');
get_model_data(true);
sizes = simsizes;
sizes.NumContStates  = 14;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 14;
sizes.NumInputs      = 7;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);

CHOSEN = 5;

x0  = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x0(CHOSEN+7) = pi/2;
str = [];
ts  = [0 0];
end

function sys = mdlDerivatives(x,u)

[LP, SV] = get_model_data(false);

q   = x(1:7);
qd  = x(8:14);
tau = u(1:7);

[M_plant,C_plant,G_plant] = get_dynamics(LP, SV, q, qd);

Dist = 1.1;

qdd = Dist * M_plant \ (tau -  Dist * C_plant -  Dist * G_plant);
sys = [qd; qdd];
end

function sys = mdlOutputs(x)
sys = x;
end

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

function [M, C, G] = get_dynamics(LP, SV, q, qd)
persistent use_mex
if isempty(use_mex)
    use_mex = true;
end
if use_mex
    try
        [M, C, G] = calc_MCG_0625_mex(LP, SV, q, qd);
        return;
    catch ME
        use_mex = false;
        warning('Plant_0625:MexFallback', ...
            ['calc_MCG_0625_mex failed for the current LP/SV size. ', ...
            'Falling back to calc_MCG_0625. Original error: %s'], ME.message);
    end
end
[M, C, G] = calc_MCG_0625(LP, SV, q, qd);
end
