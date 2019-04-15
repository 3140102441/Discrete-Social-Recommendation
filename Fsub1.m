function [ f ] = Fsub1( S, b, f, z, r, alpha, beta3,maxItr)
% F-subproblem
FLAg=1; step=0;
while FLAg && step < maxItr
    for k=1:r 
        bb = (b'*f)';
        fu0(k)=S'*b(k,:)'-bb*b(k,:)'+length(S)*f(k);
        fu(k)=alpha*fu0(k)+beta3*z(k);
        if fu(k)~=0
            if f(k)==sign(fu(k))
                fl(k)=0;
            else
                f(k)=sign(fu(k));
                fl(k)=1;
            end
        else
            continue;
        end
    end
    FLAg=sum(fl);
    step=step+1;
    
end

