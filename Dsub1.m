function [ D ] = Dsub1( Rt, B, D, Y, r, N, M, beta2)
% D-subproblem
for u=1:M
    BB = (B'*D(:,u))';
    
    FLAg=1; step=0;
    while FLAg
        for k=1:r %for every user
            du0(k)=Rt(:,u).'*B(k,:)'-BB*B(k,:)'+D(k,u);
            du(k)=du0(k)+beta2*Y(k,u);
            if du(k)~=0
                if D(k,u)==sign(du(k))
                    fl(k)=0;
                else
                    D(k,u)=sign(du(k));
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

