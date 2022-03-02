Ai = A; Bi = B;
Ai(5,1) = 1; Ai(5,5) = 0; Bi(5,1) = 0;
Qi = diag([ 80 10 1 1 0.001]);
% Q = diag([ 30 3 1 1 ]);
R = 5;        
[Ki,n_Si,n_Ei] = lqr(Ai,Bi,Qi,R);
% [K,n_S,n_E] = lqr(A,B,Q,R);
K=Ki;