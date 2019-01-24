function Q =Qsub(Rt, P, Q, Y, r, N, M, beta2)
%Q-subproblem in the initialization
for u=1:M
    Q(:,u)=Q(:,u)+beta2*Y(:,u);
end