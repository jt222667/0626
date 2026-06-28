clc;clear;
RP_data = Module_Lib();

%% module_1
module_1 = 1;
install_1 = 1;
align_1 = 0
sequence_1 = 0;
LP_module_1 = LP_generate(module_1, install_1, align_1, sequence_1, RP_data);
SV_module_1 = SV_generate(LP_module_1); 
rb_module_1 = calc_Dy_Para_0625(LP_module_1, RP_data);
LP_module_1.rb = rb_module_1;
q1 = 0
SV_module_1 = Trans_aa_pos_ori(LP_module_1,SV_module_1,q1);
PlotSV_0625(LP_module_1,SV_module_1)

%% module_2
% module_2 = 2;
% install_2 = 1;
% align_2 = 1
% sequence_2 = 0;
% LP_module_2 = LP_generate(module_2, install_2, align_2, sequence_2, RP_data);
% SV_module_2 = SV_generate(LP_module_2); 
% rb_module_2 = calc_Dy_Para_0625(LP_module_2, RP_data);
% LP_module_2.rb = rb_module_2;
% q2 = pi/2
% SV_module_2 = Trans_aa_pos_ori(LP_module_2,SV_module_2,q2);
% PlotSV_0625(LP_module_2,SV_module_2)


%% module_3
% module_3 = 3;
% install_3 = 1;
% align_3 = 0
% sequence_3 = 0;
% LP_module_3 = LP_generate(module_3, install_3, align_3, sequence_3, RP_data);
% SV_module_3 = SV_generate(LP_module_3); 
% rb_module_3 = calc_Dy_Para_0625(LP_module_3, RP_data);
% LP_module_3.rb = rb_module_3;
% q3 = pi
% SV_module_3 = Trans_aa_pos_ori(LP_module_3,SV_module_3,q3);
% PlotSV_0625(LP_module_3,SV_module_3)

%% module_4
% module_4 = 4;
% install_4 = 1;
% align_4 = 1
% sequence_4 = 0;
% LP_module_4 = LP_generate(module_4, install_4, align_4, sequence_4, RP_data);
% SV_module_4 = SV_generate(LP_module_4); 
% rb_module_4 = calc_Dy_Para_0625(LP_module_4, RP_data);
% LP_module_4.rb = rb_module_4;
% q4 = 0
% SV_module_4 = Trans_aa_pos_ori(LP_module_4,SV_module_4,q4);
% PlotSV_0625(LP_module_4,SV_module_4)

%% module_567
% module_567 = 7
% install_567 = 1;
% align_567 = 2
% sequence_567 = 0;
% LP_module_567 = LP_generate(module_567, install_567, align_567, sequence_567, RP_data);
% SV_module_567 = SV_generate(LP_module_567); 
% q567 = 0
% SV_module_567 = Trans_aa_pos_ori(LP_module_567,SV_module_567,q567);
% PlotSV_0625(LP_module_567,SV_module_567)

%% module_all
% module_all = [1 5 1 6 1 7 3]
% install_all =  [1 1 1 1 1 1 1] 
% align_all = [0 0 0 0 0 0 2]
% sequence_all = 0:6 
% LP_module_all = LP_generate(module_all, install_all, align_all, sequence_all, RP_data);
% SV_module_all = SV_generate(LP_module_all); 
% qall = [0 0 0 pi]
% SV_module_all = Trans_aa_pos_ori(LP_module_all,SV_module_all,qall);
% PlotSV_0625(LP_module_all,SV_module_all)