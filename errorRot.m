function [eR] = errorRot(R, Rd)
eR = 0.5*vee(Rd'*R-R'*Rd);
end