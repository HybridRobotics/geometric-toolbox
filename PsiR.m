function [out] = PsiR(R, Rd)
% Configuration error function for SO3
% FUNC DFN: [out] = PsiR(R, Rd)
% 
% out = 0.5*trace(eye(3)-Rd'*R);

    out = 0.5*trace(eye(3)-Rd'*R);
end