function [P, Q, R,X, Y,Z]=Initial(Train,r, beta1, beta2, beta3);
[N,M]=size(Train);
P=randn(r,N);
Q=randn(r,M);
R=randn(r,N);
times=20;
for t=1:times
    X = UpdateSVD(P);
    Y = UpdateSVD(Q);
    Z = UpdateSVD(R);
    P = Psub(Train, P, Q, X,r, N, M, beta1);
    Q = Qsub(Train, P, Q, Y, r, N, M, beta2);
    R = Rsub(Train, P, R, Z, r, N, beta3);
end
end


