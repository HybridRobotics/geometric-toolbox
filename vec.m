function v = vec(m)
%Helper function to turn a matrix of any size into a column vector using (:)
%    This function is meant to make one-line computations easy/fast when
%    subscripting already.  
%SCd 01/04/2011 (First function of 2011!)
%
%Updates: -05/24/2011: Used reshape instead of colon for speed.
%
%Usage: v = vec(m)
%
%Example:       
%    %Original way to one line the median of a slice of 3d matrix:
%    M = repmat(magic(200),[1 1 200]); %200x200x200 magic squares
%    Mmed = median(reshape(M(:,:,34),[],1)); %34th slice
%    
%    %Using the vec() function
%    Mmed = median(vec(M(:,:,34)));
%
%Input Arguments:
%   -m: matrix of any size
%
%Output Arguments:
%   -v: m(:)
%
%See Also: colon reshape
%

    v = reshape(m,numel(m),1);

end