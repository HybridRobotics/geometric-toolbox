function [phi,theta,psi] = RotToRPY_ZXY(R)


R = R';
phi = asin(min(max(R(2,3),-1),1));
if ~isreal(phi)
    keyboard;
end
psi = atan2(-R(2,1)/cos(phi),R(2,2)/cos(phi));
theta = atan2(-R(1,3)/cos(phi),R(3,3)/cos(phi));
