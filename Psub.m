function P = Psub( Rt, P, Q, X,r, N, M, beta1)
%P-subproblem in the initialization
for u=1:N
    P(:,u)=P(:,u)+beta1*X(:,u);
end
end