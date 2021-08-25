function [eOmega] = errorOmega(Omega, R, Omegad, Rd)
%%
% Input:    Om, R, Omd, Rd
% Output:   eOmega = Omega - R'*Rd*Omd
%%
eOmega = Omega - R'*Rd*Omegad;
end