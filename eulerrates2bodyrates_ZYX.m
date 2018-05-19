syms r p y dr dp dy real
R = Rz(y)*Ry(p)*Rx(r); 

e = [y; p; r];
de = [dy; dp; dr];

for i = 1:3
    for j = 1:3
        dR(i,j) = jacobian(R(i,j),e)*de;
    end
end

% dR = R*hat(Omega)
% Omega = vee(R'*dR)
Omega = vee(simplify(R'*dR))
