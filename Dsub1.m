function [ d ] = Dsub1( Rt, b, d, y, r,beta2,maxItr)
% D-subproblem

bb = (b'*d)';

FLAg=1; step=0;
while FLAg && step < maxItr
    for k=1:r 
        du0(k)=Rt'*b(k,:)'-bb*b(k,:)'+length(Rt)*d(k);
        du(k)=du0(k)+beta2*y(k);
        if du(k)~=0
            if d(k)==sign(du(k))
                fl(k)=0;
            else
                d(k)=sign(du(k));
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

