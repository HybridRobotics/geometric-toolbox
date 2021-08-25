function [x_var]  = states2variationS2(Xk, Xk1)
%% 
% function to calculate variation between two states in S^2
% X_k = [q_k; \omega_k]^T and X_{k+1} = [q_{k+1}; \omega_{k+1}]^T
% 
% x_var = X_{k+1} \ominus X_k
% x_var = [\xi, \delta\omega]^T

%%
qk = Xk(1:3); omk = Xk(4:6);
qk1 = Xk1(1:3); omk1 = Xk1(4:6);

th = acos(dot2(qk,qk1)/(norm(qk)*norm(qk1)));
n = cross2(qk,qk1);
n_norm = norm(n);
if n_norm > 1e-10
  n = n/n_norm;
  % verification step
  tmp_qk1_pos = expm(hat(th*n))*qk;
  tmp_qk1_neg = expm(hat(-th*n))*qk;
  if norm(tmp_qk1_pos-qk1) > norm(tmp_qk1_neg-qk1)
      n = -n;              
  end          
else
  n = zeros(3,1); 
end

% \xi
% ---
% xi = cross2(qk,qk1);
xi = th*n;   

% \delta_{\omega}
% ---------------
% d_om = omk1 + hat(qk1)^2*omk;
RMat = expm(hat(xi));
dqk1 = cross2(omk1,qk1); dqk = cross2(omk,qk);
d_om = -cross2((RMat'*dqk1-dqk),qk) - (dot2(omk,cross2(xi,qk)))*qk;

x_var = [xi; d_om];

end