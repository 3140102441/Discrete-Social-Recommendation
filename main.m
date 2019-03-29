clear
%load rating   %the raw data

%generate a toy random user-item matrix of 100 users and 50 items.
Train = rand(100,50);
Train(Train>0.5) = 0;
Train = Train*5;
Train = ceil(Train);
Train = sparse(Train);

%generate a toy random user-user social matrix of 100 users
S = rand(100,100);
S(S>0.5) = 0;
S = S>0 ;
S = sparse(S);

%parameter
alpha=0.02*10^-2;
beta1=0.001*10^-1;
beta2=0.001*10^-1;
beta3=0.001*10^-1;

%the length of hash code
r = 8;

Predict;


