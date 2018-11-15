function [Xk1] = variation2stateS2(Xk,x_var)
%%
% function to calculate new state by perturbing Xk on S^2
% by a variation x_var
%
% X_k = [q_k; \omega_k]^T and x_var = [\xi, \delta\omega]^T
% 
% X_{k+1} = X_k \oplus x_var
% X_{k+1} = [q_{k+1}; \omega_{k+1}]^T
% 

%%

qk = Xk(1:3); omk = Xk(4:6);
xik = x_var(1:3); d_omk = x_var(4:6);

qk1 = expm(hat(xik))*qk;

dqk = cross2(omk,qk);
dx = obj.variationalLinearDynamics(Xk,obj.uDefault)*x_var;
dxi = dx(1:3);
RMat = expm(hat(xik));
dqk1 = RMat*hat(dxi)*qk + RMat*dqk;
omk1 = cross2(qk1,dqk1);
% omk1 = d_omk - hat(qk1)^2*omk;

Xk1 = [qk1; omk1];        

end