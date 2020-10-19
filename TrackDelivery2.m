% function to track delivery from source (src) to destination (dest)
function [X_src Y_src idx idy] = TrackDelivery2(X_dest, Y_dest, X_src, Y_src, idx, idy)

% distance based computation
    tmpVar_x_dist = abs(X_src-X_dest);
    tmpVar_y_dist = abs(Y_src-Y_dest);
    if (tmpVar_x_dist > tmpVar_y_dist ) & idx ~=1
        %if x distance is greater or equal to y distance then advance x
        if X_src < X_dest 
            X_src = X_src+1;
        elseif X_src == X_dest
            % X coordinates match
            idx = 1;
        else    
            X_src = X_src-1;
        end
            
    elseif (tmpVar_y_dist > tmpVar_x_dist ) & idy ~=1
        %if y distance is greater than x distance then advance y
        if Y_src < Y_dest 
            Y_src = Y_src+1;
        elseif Y_src == Y_dest
             % Y coordinates match
            idy = 1;
        else
           Y_src= Y_src-1;
        end
    elseif tmpVar_x_dist == tmpVar_y_dist & X_src ~= X_dest 
        if X_src < X_dest 
            X_src = X_src+1;
        elseif X_src == X_dest
            % X coordinates match
            idx = 1;
        else    
            X_src = X_src-1;
        end
%     elseif tmpVar_x_dist == tmpVar_y_dist | X_del == X_res 
%         idx = 1;%(tmpVar_y_dist > tmpVar_x_dist | tmpVar_x_dist == tmpVar_y_dist) & idy ~=1
%     elseif tmpVar_x_dist == tmpVar_y_dist | Y_del == Y_res
%         idy = 1;
    else
        %nothing
    end
end