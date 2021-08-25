function [wn, xi] = getFreqDamping(kp,kd,I)

wn = sqrt(kp/I);
xi = kd/(2*wn*I);