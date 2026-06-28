clc;clear;
RP_data = Module_Lib_old();

GOUXING = 1

%% 随机构型生成
if GOUXING == 1
    [n, module_raw, install_raw, align_raw, sequence_raw] = generate_valid_config_x(RP_data);
    [module_out, install_out, align_out, sequence_out] = expand_module_units( ...
        module_raw(1:n), install_raw(1:n), align_raw(1:n), sequence_raw(1:n), RP_data);
end

%% 自定义构型1
if GOUXING == 2
    module_out   = [1 2 1 2 1 2 1];
    install_out  = ones(1,numel(module_out));
    align_out    = zeros(1,numel(module_out));
    sequence_out = 0:numel(module_out)-1;
end

%% 自定义构型1
if GOUXING == 3
    module_out   = [1 7 1 2 1 3 4 3];
    install_out  = ones(1,numel(module_out));
    align_out    = [0 1 2 0 0 2 1 1];
    sequence_out = 0:numel(module_out)-1;
end

%% 模型生成
LP = LP_generate(module_out, install_out, align_out, sequence_out, RP_data);
SV = SV_generate(LP); 
rb = calc_Dy_Para_0625(LP, RP_data);
LP.rb = rb;

%% mex生成
q = 0.3 * ones(LP.num_joint, 1); 
qd = zeros(LP.num_joint, 1); 

codegen calc_MCG_0625 ...
    -args {LP, SV, q, qd} ...
    -o calc_MCG_0625_mex ...
    -report

%% PTSMC参数设置
PTSMC_0625.T1 = 2;
PTSMC_0625.T2 = 1;
PTSMC_0625.Alpha = 0.5;
PTSMC_0625.Beta = 0.5;
PTSMC_0625.K = 0.2;