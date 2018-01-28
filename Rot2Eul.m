function [phi,theta,psi] = Rot2Eul(R1,type)
%%% This function converts a Rotation Matrix into its constituent Euler
%%% Angles. Note that, the Euler Angle Ordering here is R = (Rz)o(Rx)o(Ry)

switch lower(type)
    
    case 'degrees'    
%% For comparing with Euler Dynamics

theta = wrapTo180(myatan(-R1(3,1),R1(3,3))*(180/pi));
psi   = wrapTo180(myatan(-R1(1,2),R1(2,2))*(180/pi));
phi   = wrapTo180(myatan(R1(3,2),sqrt(R1(3,1)^2+R1(3,3)^2))*(180/pi));

    case 'radians'

%% Angles in radians

theta = atan2(-R1(3,1),R1(3,3));
psi   = atan2(-R1(1,2),R1(2,2));
phi   = atan2(R1(3,2),sqrt(R1(3,1)^2+R1(3,3)^2));


    case 'stance'

%% For Phase Portraits 

theta = atan2(-R1(3,1),R1(3,3))*(180/pi);
psi   = atan2(-R1(1,2),R1(2,2))*(180/pi);
phi   = atan2(R1(3,2),sqrt(R1(3,1)^2+R1(3,3)^2))*(180/pi);

    case 'swing'
 %% For Phase Portraits 

theta = atan2(-R1(3,1),R1(3,3))*(180/pi);
psi   = atan2(-R1(1,2),R1(2,2))*(180/pi);
phi   = atan2(R1(3,2),sqrt(R1(3,1)^2+R1(3,3)^2))*(180/pi);
 
 
      
        
end