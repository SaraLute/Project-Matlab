% function returns a matrix of 3x3 in neighborhood of given coordinate, it
% is comprised of logicals 1s and 0s

function R = searchNeighborhood(X, Y, imageMatrix)

R = imageMatrix(Y-1:Y+1,X-1:X+1);

% return R;

end