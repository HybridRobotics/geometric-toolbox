function [kp, kd] = getKpKd(wn,xi,I)

kp = I*wn^2;
kd = 2*I*wn*xi;