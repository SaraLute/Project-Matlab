%% Function to compute direction using desired direction matrix and
% neighborhood matrix, takes current and previous coordinates of delivery
% person, both the 3x3 matrix output of searchNeighborhood.m and
% desiredDirection.m and a flag 
% 
% - flag == 0 when one of the available positions is the desired position to take
% - flag == 2 when both the available position are desired positions to take, mostly occurs at corners so here we force a turn
% - flag == 1 when none of the available positions are desired positions to take, mostly occurs when source and edstination are on paralle lines
%   Here, we force the DP to go along the direction its going till it encounters a turn and then turn the flag to 2.
function [X_del, Y_del, flag] = computeDirection(desDirMat, x, y, x_pr, y_pr, avDirMat, flag)

prodMat = desDirMat.*avDirMat;                                              % Multiply the output of desiredDirection and searchNeighborhood

% Case flag == 0, when only one of available directions are desired
% direction for DP i.e. only one element of ProdMat is 1
if sum(prodMat(:)) ==  1 && flag == 0
    [row col] = ind2sub(size(prodMat), find(prodMat == 1));                 % find where desired position is 1
    X_del = x+col-2;                                                        % this formulation naturally gives the updated position DP must take
    Y_del = y+row-2;
    
% Case flag == 2, when both of available directions can be desired
% direction for DP i.e. only two elements of ProdMat are 1 , typically at
% turnings
elseif sum(prodMat(:)) == 2 | flag == 2
    % now we brute force to only go in the direction it was not traveling
    % previously, by invoking hisotry

    flag = 0;                                                               % after taking turn force flag == 0 to go back to previous case
    if x_pr == x
        % if Dp was going along constant X, then it should switch to y direction
        if prodMat(1,2) == 1 
            Y_del = y-1;
            X_del = x;
        elseif prodMat(3,2) == 1 
            Y_del = y+1;
            X_del = x;
        end
    elseif y_pr == y
        % if Dp was going along constant Y, then it should switch to x direction
        if prodMat(2,1) == 1 
            X_del = x-1;
            Y_del = y;
        elseif prodMat(2,3) == 1 
            X_del = x+1;
            Y_del = y;
        end    
    end
    
% Case flag == 1, when none of available directions can be desired
% direction for DP i.e. no elements of ProdMat is 1 , typically when DP
% direction is parallel to destination's lane 
elseif sum(prodMat(:)) == 0 || flag == 1
    
    if sum(prodMat(:)) == 0                                                 % force flag == 0 to stay on this condition till a turn occurs
        flag = 1;
    end
        
    % now we explicitly choose direction that is available to move
    if x_pr == x %then it should continue along y
        
        % if the delivery man confronts a turn then turn the flag back to 2
        if (avDirMat(2,1)==1 || avDirMat(2,3)==1)   
            flag = 2;
            X_del = x;
            Y_del = y;
        else   
            if y_pr == y-1
                X_del = x;
                Y_del = y+1;
            elseif y_pr == y+1
                X_del = x;
                Y_del = y-1;
            end
        end
        
    elseif y_pr == y %then it should continue along x
        
        % if the delivery man confronts a turn then turn the flag back to 2
        if (avDirMat(1,2)==1 || avDirMat(3,2)==1)   
            flag = 2;
            X_del = x;
            Y_del = y;
        else   
             if x_pr == x-1 
                X_del = x+1;
                Y_del = y;
             elseif x_pr == x+1
                X_del = x-1;
                Y_del = y;
             end
        end
    end

end

end