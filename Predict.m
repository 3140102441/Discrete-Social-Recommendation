%r=8; %the dimension of hash code
IDX = (Train~=0);
IDX_S = (S~=0);
%init
[P,Q,R,X,Y,Z]=Initial(Train,S,r,alpha,beta1, beta2,beta3,IDX,IDX_S);
%train
[B, D, F] =dsr_main(Train, S, P, Q, R, X, Y, Z, alpha, beta1, beta2, beta3,IDX,IDX_S);





