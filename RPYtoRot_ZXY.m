function R = RPYtoRot_ZXY(phi,theta,psi)

R = [ cos(psi)*cos(theta) - sin(phi)*sin(psi)*sin(theta),   -cos(phi)*sin(psi),     cos(psi)*sin(theta) + cos(theta)*sin(phi)*sin(psi);
    cos(theta)*sin(psi) + cos(psi)*sin(phi)*sin(theta),     cos(phi)*cos(psi),       sin(psi)*sin(theta) - cos(psi)*cos(theta)*sin(phi);
     -cos(phi)*sin(theta),                                   sin(phi),               cos(phi)*cos(theta)];
    

% R = [ cos(psi)*cos(theta) - sin(phi)*sin(psi)*sin(theta), cos(theta)*sin(psi) + cos(psi)*sin(phi)*sin(theta), -cos(phi)*sin(theta);...
%     -cos(phi)*sin(psi),                                   cos(phi)*cos(psi),                                    sin(phi);...
%     cos(psi)*sin(theta) + cos(theta)*sin(phi)*sin(psi),   sin(psi)*sin(theta) - cos(psi)*cos(theta)*sin(phi),   cos(phi)*cos(theta)];
% R = R';
