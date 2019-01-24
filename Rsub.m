function R =Rsub(Rt, P, R, Z, r, N, beta3)
%R-subproblem in the initialization
for u=1:N
    R(:,u)=R(:,u)+beta3*Z(:,u);
end