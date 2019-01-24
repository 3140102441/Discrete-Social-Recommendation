function [B, D, F] =dsr_main(Train, S, P, Q, R, X, Y, Z, alpha, beta1, beta2, beta3)
[N,M]=size(Train);
[r,N]=size(P);
B=sign(P);
D=sign(Q);
F=sign(R);
maxItr=50;
iter = 0;
converge = false;
while ~converge
    iter = iter + 1;
    B0 = B;
    D0 = D;
    F0 = F;
    B = Bsub1( Train, S, B, D, F, X, r, N, M, alpha, beta1);
    D = Dsub1(Train, B, D, Y, r, N, M, beta2);
    F = Fsub1(Train, B, F, Z, r, N, M, beta3,S);
    X = UpdateSVD(B);
    Y = UpdateSVD(D);
    Z = UpdateSVD(F);
    if iter >= maxItr || (sum(sum(B~=B0)) == 0 && sum(sum(D~=D0))&& sum(sum(F~=F0)) == 0)
        converge = true;
    end
end
end


