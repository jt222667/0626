%% 模块库初始化函数，生成模块参数结构体RP_data

function RP_data = Module_Lib()
% 参数初始化
syms theta d a alf;

SDH = [
    cos(theta),  -sin(theta)*cos(alf),  sin(theta)*sin(alf),  a*cos(theta);
    sin(theta),   cos(theta)*cos(alf), -cos(theta)*sin(alf),  a*sin(theta);
    0,            sin(alf),             cos(alf),             d;
    0,            0,                      0,                      1
    ];

Num_connection = 3;
Num_modules = 10;
Mp = zeros(4,4,Num_modules);
Md = zeros(4,4,Num_modules);
Rp = zeros(3,3,Num_modules);
Rd = zeros(3,3,Num_modules);
Pp = zeros(3,Num_modules);
Pd = zeros(3,Num_modules);
Bcp= zeros(4,4,Num_connection);  % Base_connection_point 最后一位数字由基座上包含几个接口确定
RBcp= zeros(3,3,Num_connection); % 最后一位数字由基座上包含几个接口确定
PBcp= zeros(3,Num_connection);   % 最后一位数字由基座上包含几个接口确定

theta_prox = zeros(2,Num_modules);
d_prox = zeros(2,Num_modules);
a_prox = zeros(2,Num_modules);
alf_prox = zeros(2,Num_modules);

theta_dist = zeros(2,Num_modules);
d_dist = zeros(2,Num_modules);
a_dist = zeros(2,Num_modules);
alf_dist = zeros(2,Num_modules);

T_L = zeros(4,4,Num_modules);
T_B = zeros(4,4,2);

%% module 1
% 关节模块，信息用Rp Pp Rd Pd存储
J_type(1) = 'R'; 

theta_prox(1,1) = 0;
d_prox(1,1) = 0.2;
a_prox(1,1) = 0;
alf_prox(1,1) = 0;
Mp(:,:,1) = subs(SDH, {theta, d, a, alf}, {theta_prox(1,1), d_prox(1,1), a_prox(1,1), alf_prox(1,1)});
Rp(:,:,1) = Mp(1:3,1:3,1);
Pp(:,1) =Mp(1:3,4,1);

theta_dist(1,1) = 0;
d_dist(1,1) = 0.2;
a_dist(1,1) = 0;
alf_dist(1,1) = 0;
Md(:,:,1) = subs(SDH, {theta, d, a, alf}, {theta_dist(1,1), d_dist(1,1), a_dist(1,1), alf_dist(1,1)});
Rd(:,:,1) = Md(1:3,1:3,1);
Pd(:,1) =Md(1:3,4,1);

%% module 2
% 关节模块，信息用Rp Pp Rd Pd存储
J_type(2) = 'R'; 
 
theta_prox(1,2) = 0;
d_prox(1,2) = 0.2;
a_prox(1,2) = 0;
alf_prox(1,2) = -pi/2;
Mp(:,:,2) = subs(SDH, {theta, d, a, alf}, {theta_prox(1,2), d_prox(1,2), a_prox(1,2), alf_prox(1,2)});
Rp(:,:,2) = Mp(1:3,1:3,2);
Pp(:,2) =Mp(1:3,4,2);

theta_dist(1,2) = 0;
d_dist(1,2) = 0;
a_dist(1,2) = 0;
alf_dist(1,2) = pi/2;

theta_dist(2,2) = 0;
d_dist(2,2) = 0.2;
a_dist(2,2) = 0;
alf_dist(2,2) = 0;
Md(:,:,2) = subs(SDH, {theta, d, a, alf}, {theta_dist(1,2), d_dist(1,2), a_dist(1,2), alf_dist(1,2)})*subs(SDH, {theta, d, a, alf}, {theta_dist(2,2), d_dist(2,2), a_dist(2,2), alf_dist(2,2)});
Rd(:,:,2) = Md(1:3,1:3,2);
Pd(:,2) =Md(1:3,4,2);

%% module 3
% 关节模块，信息用Rp Pp Rd Pd存储
J_type(3) = 'R';

theta_prox(1,3) = 0;
d_prox(1,3) = 0.2;
a_prox(1,3) = 0;
alf_prox(1,3) = -pi/2;

theta_prox(2,3) = 0;
d_prox(2,3) = 0.1;
a_prox(2,3) = 0;
alf_prox(2,3) = 0;
Mp(:,:,3) = subs(SDH, {theta, d, a, alf}, {theta_prox(1,3), d_prox(1,3), a_prox(1,3), alf_prox(1,3)})*subs(SDH, {theta, d, a, alf}, {theta_prox(2,3), d_prox(2,3), a_prox(2,3), alf_prox(2,3)});
Rp(:,:,3) = Mp(1:3,1:3,3);
Pp(:,3) =Mp(1:3,4,3);

theta_dist(1,3) = 0;
d_dist(1,3) = 0.1;
a_dist(1,3) = 0;
alf_dist(1,3) = 0;
Md(:,:,3) = subs(SDH, {theta, d, a, alf}, {theta_dist(1,3), d_dist(1,3), a_dist(1,3), alf_dist(1,3)});
Rd(:,:,3) = Md(1:3,1:3,3);
Pd(:,3) =Md(1:3,4,3);

%% module 4
% 关节模块（新增），信息用Rp Pp Rd Pd存储
J_type(4) = 'R';

theta_prox(1,4) = 0;
d_prox(1,4) = 0.2;
a_prox(1,4) = 0;
alf_prox(1,4) = pi/2;

theta_prox(2,4) = 0;
d_prox(2,4) = 0.2;
a_prox(2,4) = 0;
alf_prox(2,4) = 0;

Mp(:,:,4) = subs(SDH, {theta, d, a, alf}, {theta_prox(1,4), d_prox(1,4), a_prox(1,4), alf_prox(1,4)})*subs(SDH, {theta, d, a, alf}, {theta_prox(2,4), d_prox(2,4), a_prox(2,4), alf_prox(2,4)});
Rp(:,:,4) = Mp(1:3,1:3,4);
Pp(:,4) =Mp(1:3,4,4);

theta_dist(1,4) = 0;
d_dist(1,4) = 0.1;
a_dist(1,4) = 0;
alf_dist(1,4) = -pi/2;

theta_dist(2,4) = 0;
d_dist(2,4) = 0.2;
a_dist(2,4) = 0;
alf_dist(2,4) = 0;

Md(:,:,4) = subs(SDH, {theta, d, a, alf}, {theta_dist(1,4), d_dist(1,4), a_dist(1,4), alf_dist(1,4)}) * subs(SDH, {theta, d, a, alf}, {theta_dist(2,4), d_dist(2,4), a_dist(2,4), alf_dist(2,4)});
Rd(:,:,4) = Md(1:3,1:3,4);
Pd(:,4) =Md(1:3,4,4);

%% module 5
% 连杆模块（新增），参数与 module 1 相同
J_type(5) = 'L';

theta_prox(1,5) = 0;
d_prox(1,5) = 0.2;
a_prox(1,5) = 0;
alf_prox(1,5) = 0;
Mp(:,:,5) = subs(SDH, {theta, d, a, alf}, {theta_prox(1,5), d_prox(1,5), a_prox(1,5), alf_prox(1,5)});
Rp(:,:,5) = Mp(1:3,1:3,5);
Pp(:,5) =Mp(1:3,4,5);

theta_dist(1,5) = 0;
d_dist(1,5) = 0.2;
a_dist(1,5) = 0;
alf_dist(1,5) = 0;
Md(:,:,5) = subs(SDH, {theta, d, a, alf}, {theta_dist(1,5), d_dist(1,5), a_dist(1,5), alf_dist(1,5)});
Rd(:,:,5) = Md(1:3,1:3,5);
Pd(:,5) =Md(1:3,4,5);

T_L(:,:,5) = Mp(:,:,5)*Md(:,:,5);

%% module 6
% 连杆模块（原 module 4，编号顺延 +2）
J_type(6) = 'L';

theta_prox(1,6) = 0;
d_prox(1,6) = 0.2;
a_prox(1,6) = 0;
alf_prox(1,6) = -pi/2;
Mp(:,:,6) = subs(SDH, {theta, d, a, alf}, {theta_prox(1,6), d_prox(1,6), a_prox(1,6), alf_prox(1,6)});
Rp(:,:,6) = Mp(1:3,1:3,6);
Pp(:,6) = Mp(1:3,4,6);

theta_dist(1,6) = 0;
d_dist(1,6) = 0.2;
a_dist(1,6) = 0;
alf_dist(1,6) = 0;
Md(:,:,6) = subs(SDH, {theta, d, a, alf}, {theta_dist(1,6), d_dist(1,6), a_dist(1,6), alf_dist(1,6)});
Rd(:,:,6) = Md(1:3,1:3,6);
Pd(:,6) = Md(1:3,4,6);

T_L(:,:,6) = Mp(:,:,6)*Md(:,:,6);

%% module 7
% 连杆模块（原 module 5，编号顺延 +2）
J_type(7) = 'L';

theta_prox(1,7) = 0;
d_prox(1,7) = 0.2;
a_prox(1,7) = 0;
alf_prox(1,7) = -pi/4;
Mp(:,:,7) = subs(SDH, {theta, d, a, alf}, {theta_prox(1,7), d_prox(1,7), a_prox(1,7), alf_prox(1,7)});
Rp(:,:,7) = Mp(1:3,1:3,7);
Pp(:,7) =Mp(1:3,4,7);

theta_dist(1,7) = 0;
d_dist(1,7) = 0.2;
a_dist(1,7) = 0;
alf_dist(1,7) = 0;
Md(:,:,7) = subs(SDH, {theta, d, a, alf}, {theta_dist(1,7), d_dist(1,7), a_dist(1,7), alf_dist(1,7)});
Rd(:,:,7) = Md(1:3,1:3,7);
Pd(:,7) =Md(1:3,4,7);

T_L(:,:,7) = Mp(:,:,7)*Md(:,:,7);

%% 基座模块，现在将其视作模块，0,1,2,3对应基座原点和基座上的接口，这里计算T13,T12
T01 = [1 0 0 0;
    0 1 0 0;
    0 0 1 0.2;
    0 0 0 1];
T02 = Rx(2*pi/3)*T01;
T03 = Rx(4*pi/3)*T01;

T_B(:,:,1) = Rx(pi) * T_inv(T02) * T01; % T21
T_B(:,:,2) = Rx(pi) * T_inv(T02) * T03; % T23


%% 接口位姿
Bcp(:,:,1) = [1 0 0 0;
    0 1 0 0;
    0 0 1 0.2;
    0 0 0 1];
Bcp(:,:,2) = Rx(2*pi/3)*Bcp(:,:,1);
Bcp(:,:,3) = Rx(4*pi/3)*Bcp(:,:,1);

RBcp(:,:,1) = Bcp(1:3,1:3,1);
PBcp(:,1) = Bcp(1:3,4,1);
RBcp(:,:,2) = Bcp(1:3,1:3,2);
PBcp(:,2) = Bcp(1:3,4,2);
RBcp(:,:,3) = Bcp(1:3,1:3,3);
PBcp(:,3) = Bcp(1:3,4,3);

%% 集成模块
RP_data.integrated_modules = {
    struct('num',2,'module', [1 2], 'install', [1 1], 'align', [0 0]), ...
    struct('num',2,'module', [1 2 1], 'install', [1 1 1], 'align', [0 0 0]), ...
    struct('num',2,'module', [3 6 1 6 1], 'install', [1 1 1 1 1], 'align', [0 0 0 0 0]) ...
};

%% 信息存储
RP_data.Rp = Rp;     % [模块近端] --> [关节] 的旋转矩阵，维度：(3, 3, 模块数)
RP_data.Rd = Rd;     % [关节] --> [模块远端] 的旋转矩阵，维度：(3, 3, 模块数)
RP_data.Pp = Pp;     % [模块近端] --> [关节] 的位移向量，维度：(3, 模块数)
RP_data.Pd = Pd;     % [关节] --> [模块近端] 的位移向量，维度：(3, 模块数)
RP_data.RBcp = RBcp; % [基座原点] --> [基座接口处] 的旋转矩阵，维度：(3, 3, 接口数)
RP_data.PBcp = PBcp; % [基座原点] --> [基座接口处] 的位移向量，维度：(3, 接口数)
RP_data.J_type = J_type;
RP_data.T_L = T_L;
RP_data.T_B = T_B;

%% 动力学参数
mass = zeros(1,7);
COM = zeros(3,7);
Inertia = zeros(3,3,7);
mass_prox = zeros(1,4);
mass_dist = zeros(1,4);
COM_prox = zeros(3,4);
COM_dist = zeros(3,4);
Inertia_prox = zeros(3,3,4);
Inertia_dist = zeros(3,3,4);
S = @(v) (norm(v)^2 * eye(3) - v * v.');

%% -----------------------------------M1-----------------------------------
% M1 prox
m1_prox = 3.283;
rc1_prox = [0; 0; 0.142];
I1_prox_c = [
    0.022  0      0;
    0      0.022  0;
    0      0      0.021];
I1_prox_o = [
    0.088  0      0;
    0      0.088  0;
    0      0      0.021];
% I1_prox_o_confirm = I1_prox_c + m1_prox * S(rc1_prox);

% M1 dist
m1_dist = 3.283;
rc1_dist = [0; 0; 0.058];
I1_dist_c = [
    0.022  0      0;
    0      0.022  0;
    0      0      0.021];
I1_dist_o = [
    0.033  0      0;
    0      0.033  0;
    0      0      0.021];

% I1_dist_o_confirm = I1_dist_c + m1_dist * S(rc1_dist);

%% -----------------------------------M2-----------------------------------
% M2 prox
m2_prox = 3.283;
rc2_prox = [0; 0; 0.142];
I2_prox_c = [
    0.022  0      0;
    0      0.022  0;
    0      0      0.021];
I2_prox_o = [
    0.088  0      0;
    0      0.088  0;
    0      0      0.021];
% I2_prox_o_confirm = I2_prox_c + m2_prox * S(rc2_prox);

% M2 dist
m2_dist = 3.283;
rc2_dist = [0; -0.058; 0];
I2_dist_c = [
    0.022  0      0;
    0      0.021  0;
    0      0      0.022];
I2_dist_o = [
    0.033  0      0;
    0      0.021  0;
    0      0      0.033];
% I2_dist_o_confirm = I2_dist_c + m2_dist * S(rc2_dist);

%% -----------------------------------M3-----------------------------------
% M3 prox
m3_prox = 3.910;
rc3_prox = [0; 0.031; 0.168];
I3_prox_c = [
    0.041   0       0;
    0     0.038   -0.004;
    0     -0.004   0.033];
I3_prox_o = [
    0.156   0       0;
    0     0.149   -0.024;
    0     -0.024   0.037];
% I3_prox_o_confirm = I3_prox_c + m3_prox * S(rc3_prox);

% M3 dist
m3_dist = 2.456;
rc3_dist = [0; 0; 0.027];
I3_dist_c = [
    0.008  0      0;
    0      0.008  0;
    0      0      0.013];
I3_dist_o = [
    0.010  0      0;
    0      0.010  0;
    0      0      0.013];
% I3_dist_o_confirm = I3_dist_c + m3_dist * S(rc3_dist);

%% -----------------------------------M4-----------------------------------
% M4 prox
m4_prox = 4.822;
rc4_prox = [0.001; -0.085; 0.174];
I4_prox_c = [
    0.079   0       0;
    0       0.048   0.011;
    0       0.011   0.070];
I4_prox_o = [
    0.260   0.001  -0.001;
    0.001   0.194   0.082;
   -0.001   0.082   0.105];
% I4_prox_o_confirm = I4_prox_c + m4_prox * S(rc4_prox);

% M4 dist
m4_dist = 3.910;
rc4_dist = [0; 0.027; 0.135];
I4_dist_c = [
    0.041  0      0;
    0      0.031  0.004;
    0      0.004  0.040];
I4_dist_o = [
    0.116  0       0;
    0      0.103  -0.011;
    0     -0.011   0.043];
% I4_dist_o_confirm = I4_dist_c + m4_dist * S(rc4_dist);


%% -----------------------------------M5-----------------------------------
m5 = 3.308;
rc5 = [0; 0; 0.200];
I5_c = [
    0.060  0      0;
    0      0.060  0;
    0      0      0.031];
I5_o = [
    0.192  0      0;
    0      0.192  0;
    0      0      0.031];
% I5_o_confirm = I5_c + m5 * S(rc5);

%% -----------------------------------M6-----------------------------------
m6 = 2.835;
rc6 = [0; 0.052; 0.148];
I6_c = [
    0.039  0       0;
    0      0.033  -0.009;
    0     -0.009   0.033];
I6_o = [
    0.108  0       0;
    0      0.095  -0.031;
    0     -0.031   0.041];
% I6_o_confirm = I6_c + m6 * S(rc6);

%% -----------------------------------M7-----------------------------------
m7 = 3.308;
rc7 = [0; 0.026; 0.189];
I7_c = [
    0.057   0       0;
    0       0.052  -0.008;
    0      -0.008   0.036];
I7_o = [
    0.178   0       0;
    0       0.171  -0.024;
    0      -0.024   0.039];
% I7_o_confirm = I7_c + m7 * S(rc7);

%% 参数归纳
mass_prox(1) = m1_prox; mass_dist(1) = m1_dist;
mass_prox(2) = m2_prox; mass_dist(2) = m2_dist;
mass_prox(3) = m3_prox; mass_dist(3) = m3_dist;
mass_prox(4) = m4_prox; mass_dist(4) = m4_dist;
COM_prox(:,1) = rc1_prox; COM_dist(:,1) = rc1_dist;
COM_prox(:,2) = rc2_prox; COM_dist(:,2) = rc2_dist;
COM_prox(:,3) = rc3_prox; COM_dist(:,3) = rc3_dist;
COM_prox(:,4) = rc4_prox; COM_dist(:,4) = rc4_dist;
Inertia_prox(:,:,1) = I1_prox_c; Inertia_dist(:,:,1) = I1_dist_c;
Inertia_prox(:,:,2) = I2_prox_c; Inertia_dist(:,:,2) = I2_dist_c;
Inertia_prox(:,:,3) = I3_prox_c; Inertia_dist(:,:,3) = I3_dist_c;
Inertia_prox(:,:,4) = I4_prox_c; Inertia_dist(:,:,4) = I4_dist_c;

mass(5) = m5; COM(:,5) = rc5; Inertia(:,:,5) = I5_c;
mass(6) = m6; COM(:,6) = rc6; Inertia(:,:,6) = I6_c;
mass(7) = m7; COM(:,7) = rc7; Inertia(:,:,7) = I7_c;

RP_data.mass = mass;
RP_data.COM = COM;
RP_data.Inertia = Inertia;
RP_data.mass_prox = mass_prox;
RP_data.mass_dist = mass_dist;
RP_data.COM_prox = COM_prox;
RP_data.COM_dist = COM_dist;
RP_data.Inertia_prox = Inertia_prox;
RP_data.Inertia_dist = Inertia_dist;

end

