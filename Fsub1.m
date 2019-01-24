function [ F ] = Fsub1( Rt, B, F, Z, r, N, M, beta3,S)
% F-subproblem
for u=1:N
    BB = (B'*F(:,u))';
    FLAg=1; step=0;
    while FLAg
        for k=1:r %for every user
            fu0(k)=S(u,:)*B(k,:)'-BB*B(k,:)'+F(k,u);
            fu(k)=fu0(k)+beta3*Z(k,u);
            if fu(k)~=0
                if F(k,u)==sign(fu(k))
                    fl(k)=0;
                else
                    F(k,u)=sign(fu(k));
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

