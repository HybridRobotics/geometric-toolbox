function [flagSO3, varargout] = isSO3(R,varargin)
% function to check if the given matrix
% is a rotation matrix.
%
% INPUT ARGS:
% 1. R - 3x3 matrix (potential rotation matrix)
% 2. (optional) errorTol [1x1] - norm tolerance vaule. 

%%
errorTol = 1e-6; % default tolerance

if nargin>1
    errorTol = varargin{1};
end
n = length(R);

if ~((size(R,1)==3 && size(R,2)==3) || (size(R,1)==2 && size(R,2)==2)) 
    error('Dimension error!\n Size of R should be 3x3 or 2x2');
end

check = norm(R'*R-eye(n));

if check < errorTol
    flagSO3 = true;
else
    flagSO3 = false;
end

if nargout > 1
    varargout{1} = check;
end

end