function [ B ] = Bsub1( Rt, S, B, D, F, X, r, N, M, alpha, beta1)
% B-subproblem
for u=1:N
    DD = (D'*B(:,u))';
    FF= (F'*B(:,u))';
    
    FLAg=1; step=0;
    while FLAg
        for k=1:r %for every user
            bu0(k)=Rt(u,:)*D(k,:)'-DD*D(k,:)'+B(k,u)+alpha*(S(u,:)*F(k,:)'-FF*F(k,:)');
            bu(k)=bu0(k)+beta1*X(k,u);
            if bu(k)~=0
                if B(k,u)==sign(bu(k))
                    fl(k)=0;
                else
                    B(k,u)=sign(bu(k));
                    fl(k)=1;
                end
            else
                continue;
            end
        end
        FLAg=sum(fl);
        step=step+1;
    end
end
end