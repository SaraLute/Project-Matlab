% function that genreates a 3x3 matric with 1s only in the direction
% pointing from source towards destination

function T = desiredRichting(X_src, Y_src, X_dst, Y_dst)

T = zeros(3);

% Y-direction
if Y_dst > Y_src
    T(3,2) = 1;
elseif Y_dst < Y_src
    T(1,2) = 1;
end
    
% X-direction
if X_dst > X_src
    T(2,3) = 1;
elseif X_dst < X_src
    T(2,1) = 1;
end



end