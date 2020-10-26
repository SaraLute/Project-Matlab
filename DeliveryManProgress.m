% Function that takes coorindates of delivery man at source (src) and optimizes
% or tracks delivery till it reaches a destination (dst)
function [X_dst, Y_dst, time] = DeliveryManProgress(X_src, Y_src, X_dst, Y_dst, TrajectoryMap, mapOfCity, colorOfMap, marker, destination)

figure(1)
% Setup more presentable map of the city and marks the coorindates of
% source and destination
imshow(mapOfCity, colorOfMap)
hold on
plot(X_dst,Y_dst,marker,'MarkerSize', 15, 'LineWidth', 4);
hold on
plot(X_src,Y_src,'-*g','MarkerSize', 15, 'LineWidth', 4);
hold on
title(['Tracking delivery person to ', destination])

% Storing temporary variables
count = 0;                                                                   % temporary variable to count number of steps taken by delivery person
X_prev_src = [X_src]; Y_prev_src = [Y_src];                                  % storing history of delivery person in terms of coordinates
flag = 0;                                                                    % useful flag to brute force a particular path to delivery man - computeDirection
path_history = [flag];                                                       % storing history of flags (useful for debugging) in due course of delivery/pickup

% Run the following snippet till either the source coorindates equals
% destination or stop at 1500 iterations (brute force)
while (X_src ~= X_dst || Y_src ~= Y_dst) && count<1500
    
    if rem(count,20) == 0                                                   % display the delivery man's position in real time once in every 1                                                                     
        plot(X_src,Y_src, marker, 'MarkerSize', 10, 'LineWidth', 2);        % min,(time is scaled to 20)
    end
    drawnow
    hold on
      
    des_dir = desiredDirection(X_src, Y_src, X_dst, Y_dst);                 % Computing next desired position of delivery man
    Neighborhood_del = searchNeighborhood(X_src, Y_src, TrajectoryMap);     % Computing available positions of delivery man in the binary map
    
    if count == 0                                                           % Computing next available position of delivery man based on above two outputs
    [X_src, Y_src, flag] = computeDirection(des_dir, X_src, Y_src, X_prev_src(end),...
        Y_prev_src(end), Neighborhood_del, flag);
    else
    [X_src, Y_src, flag] = computeDirection(des_dir, X_src, Y_src, X_prev_src(end-1), ...
        Y_prev_src(end-1), Neighborhood_del, flag);

    end
    
    X_prev_src = [X_prev_src; X_src];                                       % storing history of delivery man
    Y_prev_src = [Y_prev_src; Y_src];
    
    count = count+1;                                                        % storing the time taken as count variable
    
    path_history = [path_history; flag];                                    % storing flag history of compute Direction function (useful for debugging)
end

time = count/20;                                                            % Divinding the total count of steps by 20 to scale the time to minutes
disp(['Delivery person at ', destination, ' in ', num2str(time), ' minutes']);

end