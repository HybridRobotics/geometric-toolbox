function R = b3toR(b3,varargin)

b1d = [1; 0; 0];

b1 = -(vec_cross(b3,vec_cross(b3,b1d)))/norm(vec_cross(b3,b1d));
b2 = vec_cross(b3,b1);

R = [b1 b2 b3];
end