function [out] = PsiR(R, Rd)
    out = 0.5*trace(eye(3)-Rd'*R);
end