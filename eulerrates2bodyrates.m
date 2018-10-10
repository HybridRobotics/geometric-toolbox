syms r p y dr dp dy real
% R = Rz(y)*Ry(p)*Rx(r); 
R = RPYtoRot_ZXY(r,p,y);

e = [r;p;y];
de = [dr; dp; dy];

for i = 1:3
    for j = 1:3
        dR(i,j) = jacobian(R(i,j),e)*de;
    end
end

% dR = R*hat(Omega)
% Omega = vee(R'*dR)
Omega = vee(simplify(R'*dR))

A = [cos(p), 0, -cos(r)*sin(p);
        0, 1, sin(r);
        sin(p), 0, cos(p)*cos(r)];
simplify(A*de-Omega)
invA = simplify(inv(A));

matlabFunction(invA, 'File','Omega2eulerratesMat_ZXY','Vars',{e});
