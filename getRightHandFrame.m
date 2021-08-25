function R = getRightHandFrame(b1d, b3,varargin)

if norm(cross(b3,b1d)) == 0
    b1d = [0; 1; 0];
end

b1 = -(vec_cross(b3,vec_cross(b3,b1d)))/norm(vec_cross(b3,b1d));
b2 = vec_cross(b3,b1);

R = [b1 b2 b3];
end