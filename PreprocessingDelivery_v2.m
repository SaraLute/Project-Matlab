% Pre-processing the map of city -sub-part of main


%[mapOfCity, mapColor] = imread('sample_map.png');
%threshMap = im2bw(rgb2gray(mapOfCity), 0.9);

clc;
clear all;
close all;

mapOfCity = imread('sample_map2.png');
threshMap = im2bw(mat2gray(mapOfCity), 0.1);

% skeletalMap = bwmorph(threshMap, 'skel', Inf);
% TrajectoryMap = bwmorph(skeletalMap, 'diag');
% TrajectoryMap = bwmorph(TrajectoryMap, 'spur');
TrajectoryMap = threshMap; 
[rowsBP, columnsBP] = find(TrajectoryMap);


%%
figure(1)
% position of restaurant and destination

imshow(TrajectoryMap)
hold on
% select restaurant
pos_res = randi(length(columnsBP));
X_res = columnsBP(pos_res);
Y_res = rowsBP(pos_res);
plot(X_res,Y_res,'xb','MarkerSize', 15, 'LineWidth', 4);
% select destination

pos_des = randi(length(columnsBP));
while pos_des == pos_res
pos_des = randi(length(columnsBP));
end
X_des = columnsBP(pos_des);
Y_des = rowsBP(pos_des);
% [x_des, y_des] = ginput(1);
plot(X_des,Y_des,'or','MarkerSize', 15, 'LineWidth', 4);


%% Computing position of delivery person in real time

%initializing current position of delivery person - function from Kaiyu
% currently taking two random positions withing the image grid i.e. r x c
% [r c] = size(mapOfCity);
pos_del = randi(length(columnsBP));
while pos_del == pos_res && pos_del == pos_des
pos_del = randi(length(columnsBP));
end
pos_del = randi(length(columnsBP));
X_del = columnsBP(pos_del);
Y_del = rowsBP(pos_del);
% [X_del, Y_del] = ginput(1);
plot(X_del,Y_del,'-*g','MarkerSize', 15, 'LineWidth', 4);

buur_del = zoekBuurman(X_del, Y_del, TrajectoryMap); 

% storing temporary variables
count = 0; %temporary variable
X_prev_del = [X_del]; Y_prev_del = [Y_del];
flag = 0; % useful flag to brute force a particular path to delivery man 
path_history = [flag];

while X_del ~= X_res | Y_del ~= Y_res
    
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
        Y_prev_del(end-1), buur_del, flag)

    end
%storing history of delivery man

    X_prev_del = [X_prev_del; X_del];
    Y_prev_del = [Y_prev_del; Y_del];
    
    count = count+1;
    
    path_history = [path_history; flag];
end

disp(['Delivery person reached in ', num2str(count), ' minutes']);