k = 2500

q_desire = q_D(k,:)';
qd_desire = q_D_dot(k,:)';
qdd_desire = q_D_dot_dot(k,:)';


[M, C, G] = calc_MCG_0625(LP, SV, q_desire, qd_desire);
tau = M * qdd_desire + C + G;
 
qdd_actual = M \ (tau - C - G);

qdd_err = qdd_desire - qdd_actual


