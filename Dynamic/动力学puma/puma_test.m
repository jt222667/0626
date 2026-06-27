mdl_puma560
p560.gravity = [0 0 -9.81];

t = linspace(0,10,1000);
[q, qd, qdd] = quintic_traj_0625(t, 0, pi/2, 10);

i = 995;

qt_scalar   = q(i);
qdt_scalar  = qd(i);
qddt_scalar = qdd(i);

qt   = qt_scalar   * ones(1,6);
qdt  = qdt_scalar  * ones(1,6);
qddt = qddt_scalar * ones(1,6);

tau = p560.rne(qt, qdt, qddt);

M = p560.inertia(qt);
G = p560.gravload(qt);
Cqd = p560.rne(qt, qdt, zeros(1,6)) - G;

q_desire = qt(:);
qd_desire = qdt(:);
qdd_desire = qddt(:);
tau = tau(:);
G = G(:);
Cqd = Cqd(:);

qdd_actual = M \ (tau - Cqd - G);
qdd_err = qdd_desire - qdd_actual

%% State perturbation sensitivity test for PUMA560 open-loop feedforward
rng(1);
eps_list = [1e-6 1e-5 1e-4 1e-3 1e-2];

fprintf('\nPUMA560 state perturbation sensitivity:\n');
for epsi = eps_list
    qA  = q_desire  + epsi * randn(6,1);
    qAd = qd_desire + epsi * randn(6,1);

    qA_row = qA(:).';
    qAd_row = qAd(:).';

    M_a = p560.inertia(qA_row);
    G_a = p560.gravload(qA_row).';
    C_a = p560.rne(qA_row, qAd_row, zeros(1,6)).' - G_a;

    qdd_actual2 = M_a \ (tau - C_a - G_a);

    fprintf('eps=%g, norm(qdd_err)=%.6g\n', ...
        epsi, norm(qdd_desire - qdd_actual2));
end
