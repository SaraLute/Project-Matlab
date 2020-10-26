% Function that takes coorindates of delivery man, restaurant and map to
% provide time taken to complete task and updated coordinates of delivery
% man which is now at the restaurant
function [X_des, Y_des, time] = RestaurantManToDestination(X_res, Y_res, X_des, Y_des, TrajectoryMap)

figure(1)
imshow(TrajectoryMap)
hold on
plot(X_res,Y_res,'xb','MarkerSize', 15, 'LineWidth', 4);
hold on
plot(X_des,Y_des,'or','MarkerSize', 15, 'LineWidth', 4);
hold on
title('Tracking delivery peron to destination')

%buur_res = zoekBuurman(X_del, Y_del, TrajectoryMap); 

% storing temporary variables
count = 0; %temporary variable
X_prev_res = [X_res]; Y_prev_res = [Y_res];
flag = 0; % useful flag to brute force a particular path to delivery man 
path_history = [flag];

while (X_res ~= X_des || Y_res ~= Y_des) && count<1000
    
    % display the delivery man in real time
    if rem(count,10) == 0
        plot(X_res,Y_res, 'or', 'MarkerSize', 10, 'LineWidth', 2);
    end
    drawnow
    hold on
      
    % computing next position of delivery man
    des_dir = desiredRichting(X_res, Y_res, X_des, Y_des);
    buur_res = zoekBuurman(X_res, Y_res, TrajectoryMap);
    
    if count == 0
    [X_res, Y_res, flag] = computeRichting(des_dir, X_res, Y_res, X_prev_res(end),...
        Y_prev_res(end), buur_res, flag);
    else
    [X_res, Y_res, flag] = computeRichting(des_dir, X_res, Y_res, X_prev_res(end-1), ...
        Y_prev_res(end-1), buur_res, flag);

    end
%storing history of delivery man

    X_prev_res = [X_prev_res; X_res];
    Y_prev_res = [Y_prev_res; Y_res];
    
    count = count+1;
    
    path_history = [path_history; flag];
end

time = count/20;
% Divinding the total count of steps by 20 to scale the time to minutes
disp(['Delivery person reached destination in ', num2str(time), ' minutes']);

end