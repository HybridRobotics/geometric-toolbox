function [eR] = errorRot(R, Rd)
%%
% Input:    R, Rd
% Output:   eR = 0.5*vee(Rd'*R-R'*Rd)
%%
eR = 0.5*vee(Rd'*R-R'*Rd);
end