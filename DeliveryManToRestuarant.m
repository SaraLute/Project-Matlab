% Function that takes coorindates of delivery man, restaurant and map to
% provide time taken to complete task and updated coordinates of delivery
% man which is now at the restaurant
function [X_res, Y_res, time] = DeliveryManToRestuarant(X_del, Y_del, X_res, Y_res, TrajectoryMap)

figure(1)
imshow(TrajectoryMap)
hold on
plot(X_res,Y_res,'xb','MarkerSize', 15, 'LineWidth', 4);
hold on
plot(X_del,Y_del,'-*g','MarkerSize', 15, 'LineWidth', 4);
hold on
title('Tracking delivery peron to restaurant')

buur_del = zoekBuurman(X_del, Y_del, TrajectoryMap); 

% storing temporary variables
count = 0; %temporary variable
X_prev_del = [X_del]; Y_prev_del = [Y_del];
flag = 0; % useful flag to brute force a particular path to delivery man 
path_history = [flag];

while (X_del ~= X_res || Y_del ~= Y_res) && count<1000
    
    % display the delivery man in real time
    if rem(count,10) == 0
        plot(X_del,Y_del, 'bx', 'MarkerSize', 10, 'LineWidth', 2);
    end
    drawnow
    hold on
      
    % computing next position of delivery man
    des_dir = desiredRichting(X_del, Y_del, X_res, Y_res);
    buur_del = zoekBuurman(X_del, Y_del, TrajectoryMap);
    
    if count == 0
    [X_del, Y_del, flag] = computeRichting(des_dir, X_del, Y_del, X_prev_del(end),...
        Y_prev_del(end), buur_del, flag);
    else
    [X_del, Y_del, flag] = computeRichting(des_dir, X_del, Y_del, X_prev_del(end-1), ...
        Y_prev_del(end-1), buur_del, flag);

    end
%storing history of delivery man

    X_prev_del = [X_prev_del; X_del];
    Y_prev_del = [Y_prev_del; Y_del];
    
    count = count+1;
    
    path_history = [path_history; flag];
end

time = count/20;
% Divinding the total count of steps by 20 to scale the time to minutes
disp(['Delivery person collected order in ', num2str(time), ' minutes']);

end