function [B, D, F] =dsr_main(Train, S, P, Q, R, X, Y, Z, alpha, beta1, beta2, beta3,IDX,IDX_S)
[N,M]=size(Train);
[r,N]=size(P);
B=sign(P);
B(B == 0) = 1;
D=sign(Q);
D(D == 0) = 1;
F=sign(R);
F(F == 0) = 1;
maxItr=50;
iter = 0;
converge = false;
while ~converge
    iter = iter + 1;
    B0 = B;
    D0 = D;
    F0 = F;
    %%update B
    parfor i = 1:N
        B(:,i) = Bsub1(ScaleScore(Train(i,IDX(i,:)),r,5,1), S(i,IDX_S(i,:)), B(:,i), D(:,IDX(i,:)), F(:,IDX_S(i,:)), X(:,i), r, alpha, beta1,maxItr);
    end
    %%update D
    parfor j = 1:M
        D(:,j) = Dsub1(ScaleScore(Train(IDX(:,j),j),r,5,1), B(:,IDX(:,j)), D(:,j), Y(:,j), r, beta2,maxItr);
    end
    %%update F
    parfor j = 1:N
        F(:,j) = Fsub1(S(IDX_S(:,j),j), B(:,IDX_S(:,j)), F(:,j), Z(:,j), r,alpha,beta3,maxItr);
    end
    %%update X Y Z 
    X = UpdateSVD(B);
    Y = UpdateSVD(D);
    Z = UpdateSVD(F);
    if iter >= maxItr || (sum(sum(B~=B0)) == 0 && sum(sum(D~=D0))&& sum(sum(F~=F0)) == 0)
        converge = true;
    end
end
end


