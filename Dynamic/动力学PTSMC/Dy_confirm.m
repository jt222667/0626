k = 2500

q_desire = q_D(k,:)';
qd_desire = q_D_dot(k,:)';
qdd_desire = q_D_dot_dot(k,:)';


[M, C, G] = calc_MCG_0625(LP, SV, q_desire, qd_desire);
tau = M * qdd_desire + C + G;
 
qdd_actual = M \ (tau - C - G);

qdd_err = qdd_desire - qdd_actual


%%
qA = q_desire + 1e-3*randn(7,1);
qAd = qd_desire + 1e-3*randn(7,1);

[M_d, C_d, G_d] = calc_MCG_0625(LP, SV, q_desire, qd_desire);
tau = M_d*qdd_desire + C_d + G_d;

[M_a, C_a, G_a] = calc_MCG_0625(LP, SV, qA, qAd);
qdd_actual2 = M_a \ (tau - C_a - G_a);

qdd_err2 = qdd_desire - qdd_actual2

%%
eps_list = [1e-6 1e-5 1e-4 1e-3 1e-2];

for epsi = eps_list
    qA  = q_desire  + epsi*randn(7,1);
    qAd = qd_desire + epsi*randn(7,1);

    [M_a, C_a, G_a] = calc_MCG_0625(LP, SV, qA, qAd);
    qdd_actual2 = M_a \ (tau - C_a - G_a);

    fprintf('eps=%g, norm(qdd_err)=%.6g\n', ...
        epsi, norm(qdd_desire - qdd_actual2));
end