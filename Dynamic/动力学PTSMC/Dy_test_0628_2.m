q  = zeros(7,1);
qd = zeros(7,1);

dt = 0.001;
N = 6000

% ===== 记录变量 =====
q_log   = zeros(7, N);
qd_log  = zeros(7, N);
qdd_log = zeros(7, N);

for i = 1:N

    tau_i = tau(i,:)';

    [M, C, G] = calc_MCG_0625_mex(LP, SV, q, qd);

    qdd = M \ (tau_i - C - G);

    % ===== 积分（半隐式Euler）=====
    qd = qd + qdd * dt;
    q  = q  + qd  * dt;

    % ===== 记录 =====
    q_log(:,i)   = q;
    qd_log(:,i)  = qd;
    qdd_log(:,i) = qdd;

end

t = (0:N-1) * dt;

figure;
for j = 1:7
    subplot(7,1,j);
    plot(t, qd_log(j,:));
    ylabel(['qd', num2str(j)]);
end
xlabel('Time (s)');


figure;
for j = 1:7
    subplot(7,1,j);
    plot(t, qdd_log(j,:));
    ylabel(['qdd', num2str(j)]);
end
xlabel('Time (s)');