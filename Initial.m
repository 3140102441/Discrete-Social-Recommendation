function [P, Q, R,X, Y,Z]=Initial(Train,S,r,alpha,beta1, beta2,beta3,IDX,IDX_S)
[N,M]=size(Train);
P=randn(r,N);
Q=randn(r,M);
R=randn(r,N);
X = UpdateSVD(P);
Y = UpdateSVD(Q);
Z = UpdateSVD(R);

maxItr=20;
tol = 1e-5;
it = 1;
converge = false;
while ~converge
    P0 = P;
    Q0 = Q;
    R0 = R;
    X0 = X;
    Y0 = Y;
    Z0 = Z;
    parfor i = 1:N
        Qi = Q(:,IDX(i,:));
        Tri = Train(i,IDX(i,:));
        Si = S(i,IDX_S(i,:))
        Ri = R(:,IDX_S(i,:));
        if isempty(Tri) && isempty(Si)
            continue;
        end
        Tri = ScaleScore(Tri,r,5,1);
        temp1 = Qi*Tri'+alpha*Ri*Si'+beta1*X(:,i);
        temp2 = Qi*Qi'+alpha*Ri*Ri'+beta1;
        P(:,i) = temp2\temp1;
    end
    parfor j = 1:M
        Pj = P(:,IDX(:,j));
        Trj = Train(IDX(:,j),j);
        if isempty(Trj)
            continue;
        end
        Trj = ScaleScore(Trj,r,5,1);
        temp1 = Pj*Pj'+beta2;%quadratic term
        temp2 = Pj*Trj+beta2*Y(:,j);% linear term
        Q(:,j) = temp1\temp2;
    end
    parfor j = 1:N
        Pj = P(:,IDX_S(:,j));
        Sj = S(IDX_S(:,j),j);
        if isempty(Sj)
            continue;
        end
        temp1 = (alpha*Pj)*Pj'+beta3;%quadratic term
        temp2 = Pj*Sj*alpha+beta3*Z(:,j);% linear term
        R(:,j) = temp1\temp2;
    end
    
    X = UpdateSVD(P);
    Y = UpdateSVD(Q);
    Z = UpdateSVD(R);
    
    if it >= maxItr || max([norm(P-P0,'fro') norm(Q-Q0,'fro') norm(R-R0,'fro') norm(X-X0,'fro') norm(Y-Y0,'fro') norm(Z-Z0,'fro')]) < max([N M])*tol
        converge = true;
    end
    it = it + 1;
end
end


