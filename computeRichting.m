% function to compute direction using desired direction matrix and buur
% matrix
% flag = 0 when the delivery man moves towards the target in the shortest
% path
% flag = 2 when it encounters a turn
% flag = 1 when it does not have an alternate but go along available path 
function [X_del, Y_del, flag] = computeRichting(desDirMat, x, y, x_pr, y_pr, avDirMat, flag)

prodMat = desDirMat.*avDirMat;

% when only one desired direction is found
if sum(prodMat(:)) ==  1 && flag == 0
    [r c] = ind2sub(size(prodMat), find(prodMat == 1));
    X_del = x+c-2;
    Y_del = y+r-2;
    
% when two possible directions are there
elseif sum(prodMat(:)) == 2 | flag == 2
    % now we brute force to only go in the direction it was not traveling
    % previously, by invoking hisotry
    % here flag == 1 when delivery man does not have shortest path and has
    % to carry on along the same path i.e. sum == 0 case below 
    flag = 0;
    if x_pr == x
        % should switch to y direction
        if prodMat(1,2) == 1 
            Y_del = y-1;
            X_del = x;
        elseif prodMat(3,2) == 1 
            Y_del = y+1;
            X_del = x;
        end
    elseif y_pr == y
        % should switch to x direction
        if prodMat(2,1) == 1 
            X_del = x-1;
            Y_del = y;
        elseif prodMat(2,3) == 1 
            X_del = x+1;
            Y_del = y;
        end    
    end
% if sum is 0 we are probably at the destination
elseif sum(prodMat(:)) == 0 || flag == 1
    
    % if sum is zero we have to force delivery man in given direction i.e.
    % turn flag = ON
    if sum(prodMat(:)) == 0
        flag = 1;
    end
        
    % now we explicitly choose direction that is available to move
    if x_pr == x %then it should continue along y
        
        % if the delivery man confronts a turn then turn the flag OFF
        if (avDirMat(2,1)==1 || avDirMat(2,3)==1)   %(avDirMat(1,2)~=1 & avDirMat(3,2)~=1)
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
        
        % if the delivery man confronts a turn then turn the flag OFF
        if (avDirMat(1,2)==1 || avDirMat(3,2)==1)   %(avDirMat(2,1)~=1 & avDirMat(2,3)~=1) 
            flag = 2;
            X_del = x;
            Y_del = y-1;
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