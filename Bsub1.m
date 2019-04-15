function [ b ] = Bsub1( Rt, S, b, d, f, x, r,alpha, beta1,maxItr)
% B-subproblem
FLAg=1; step=0;
while FLAg && step < maxItr
    for k=1:r 
        dd = (d'*b)';
        ff= (f'*b)';
        bu0(k)=Rt*d(k,:)'-dd*d(k,:)'+length(Rt)*b(k)+alpha*(S*f(k,:)'-ff*f(k,:)'+length(S)*b(k));
        bu(k)=bu0(k)+beta1*x(k);
        if bu(k)~=0
            if b(k)==sign(bu(k))
                fl(k)=0;
            else
                b(k)=sign(bu(k));
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