function [q] = Rot2RPY_ZXY(R)


q = zeros(3,1) ;
q(2) = atan2(-R(3,1), R(3,3)) ;
q(3) = atan2(-R(1,2), R(2,2)) ;
q(1) = atan2(R(3,2)*cos(q(2)), R(3,3)) ;
% q(1) = atan2(R(3,2)*sin(q(3)), -R(1,2)) ;

R2 = RPY2Rot_ZXY(q);


% R = R';
% phi = asin(R(2,3));
% psi = atan2(-R(2,1)/cos(phi),R(2,2)/cos(phi));
% theta = atan2(-R(1,3)/cos(phi),R(3,3)/cos(phi));


% if norm2(R(:)-R2(:)) > 1e-6
%     q(1) = -q(1);
%     q(2) = q(2)+pi;
%     q(3) = q(3)+pi;
% end

%%

% if sum(isnan(R(:)))> 0
%     keyboard;
% end
% if isnan(det(R))
%     keyboard;
% end
% 
% R = R';
% phi = asin(R(2,3));
% 
% if cos(phi) < 0
%     keyboard;
% end
% 
% psi = atan2(-R(2,1)/cos(phi),R(2,2)/cos(phi));
% theta = atan2(-R(1,3)/cos(phi),R(3,3)/cos(phi));
% rpy = [phi; theta; psi];

end
