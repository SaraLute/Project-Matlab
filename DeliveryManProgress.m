% Function that takes coorindates of delivery man at source and optimizes
% or tracks delivery till it reaches a destination
function [X_dst, Y_dst, time] = DeliveryManProgress(X_src, Y_src, X_dst, Y_dst, TrajectoryMap, marker, destination)

figure(1)
imshow(TrajectoryMap)
hold on
plot(X_dst,Y_dst,marker,'MarkerSize', 15, 'LineWidth', 4);
hold on
plot(X_src,Y_src,'-*g','MarkerSize', 15, 'LineWidth', 4);
hold on
title(['Tracking delivery peron to ', destination])

% storing temporary variables
count = 0; %temporary variable
X_prev_src = [X_src]; Y_prev_src = [Y_src]; % storing history of deliverman
flag = 0; % useful flag to brute force a particular path to delivery man 
path_history = [flag]; % tracking trajcetory flagsof delivery person

while (X_src ~= X_dst || Y_src ~= Y_dst) && count<1000
    
    % display the delivery man in real time
    if rem(count,10) == 0
        plot(X_src,Y_src, marker, 'MarkerSize', 10, 'LineWidth', 2);
    end
    drawnow
    hold on
      
    % computing next position of delivery man
    des_dir = desiredRichting(X_src, Y_src, X_dst, Y_dst);
    buur_del = zoekBuurman(X_src, Y_src, TrajectoryMap);
    
    if count == 0
    [X_src, Y_src, flag] = computeRichting(des_dir, X_src, Y_src, X_prev_src(end),...
        Y_prev_src(end), buur_del, flag);
    else
    [X_src, Y_src, flag] = computeRichting(des_dir, X_src, Y_src, X_prev_src(end-1), ...
        Y_prev_src(end-1), buur_del, flag);

    end
    
%storing history of delivery man
    X_prev_src = [X_prev_src; X_src];
    Y_prev_src = [Y_prev_src; Y_src];
    
% storing the time taken as count variable
    count = count+1;
    
    path_history = [path_history; flag];
end

% Divinding the total count of steps by 20 to scale the time to minutes
time = count/20;
disp(['Delivery person at ', destination, ' in ', num2str(time), ' minutes']);

end