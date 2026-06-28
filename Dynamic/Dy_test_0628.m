clc;clear;
RP_data = Module_Lib_old();

[n, module_raw, install_raw, align_raw, sequence_raw] = generate_valid_config_x(RP_data);
[module_out, install_out, align_out, sequence_out] = expand_module_units( ...
    module_raw(1:n), install_raw(1:n), align_raw(1:n), sequence_raw(1:n), RP_data);

align_out = zeros(1,numel(sequence_out));

LP = LP_generate(module_out, install_out, align_out, sequence_out, RP_data);
SV = SV_generate(LP);
align_og = LP.align/(2*pi/3);
[sub_module, sub_align] = split_joint_chain(LP.module, align_og);
rb(LP.num_joint) = struct('m', [], 'rc', [], 'I', []);

for i = 1:LP.num_joint-1
    [rb(i).m, rb(i).rc, rb(i).I] = calc_rigid_body_params_0625(sub_module{i}, sub_align{i}, RP_data);
end
