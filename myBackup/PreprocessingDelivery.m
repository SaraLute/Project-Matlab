% Pre-processing the map of city -sub-part of main


%[mapOfCity, mapColor] = imread('sample_map.png');
%threshMap = im2bw(rgb2gray(mapOfCity), 0.9);

clc;
clear all;
close all;

mapOfCity = imread('sample_map.png');
threshMap = mat2gray(mapOfCity);

%threshMap = im2bw(mapOfCity, 0.1);



figure(1)
% position of restaurant and destination
imshow(threshMap)
hold on
% select restaurant
[x_res,y_res] = ginput(1);
plot(x_res,y_res,'or');
% select destination
[x_des, y_des] = ginput(1);
plot(x_des,y_des,'xb');

%rouding off the cooridnates to integer values
X_res = x_res;
Y_res = y_res;
X_des = x_des;
Y_des = y_des;

%% Computing position of delivery person in real time

%initializing current position of delivery person - function from Kaiyu
% currently taking two random positions withing the image grid i.e. r x c
[r c] = size(mapOfCity);
X_del = randi(r);
Y_del = randi(c);

count = 0; %temporary variable
tmpVar_x_dist = abs(X_del-X_res);
tmpVar_y_dist = abs(Y_del-Y_res);
idx = 0; idy =0;

% First the delivery person goes to restaurant
while (tmpVar_x_dist>1) | (tmpVar_y_dist>1) %(X_del~=X_res && Y_del~=Y_res) & count < 1000 
    
    % plot the position of delivery person
    if rem(count,20) == 0
        plot(X_del,Y_del, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
    end
    drawnow
    hold on
 
    if X_del~=X_res && Y_del~=Y_res
        [X_del Y_del] = TrackDelivery(X_res, Y_res, X_del, Y_del, idx, idy);
    elseif idx == 1 && idy == 1
        break;
    end
 
    tmpVar_x_dist = abs(X_del-X_res);
    tmpVar_y_dist = abs(Y_del-Y_res);

    count = count+1;
end

disp(['Order taken in ', num2str(count), ' minutes']);

%% Tracking delivery from restaurant to destination

% Second the delivery person goes from resturant to destination

count = 0; %temporary variable
tmpVar_x_dist = abs(X_del-X_des);
tmpVar_y_dist = abs(Y_del-Y_des);
idx = 0; idy =0;

while (tmpVar_x_dist>1) | (tmpVar_y_dist>1)%X_del~=X_res && Y_del~=Y_res   % & count < 1000
    
    % plot the position of delivery person
    if rem(count,20) == 0
        plot(X_del,Y_del, 'bx', 'MarkerSize', 10, 'LineWidth', 2);
    end
    drawnow
    hold on
 
    if X_del~=X_des && Y_del~=Y_des
        [X_del Y_del] = TrackDelivery(X_des, Y_des, X_del, Y_del, idx, idy);
    else
        break;
    end
 
    tmpVar_x_dist = abs(X_del-X_des);
    tmpVar_y_dist = abs(Y_del-Y_des);

    count = count+1;
end

disp(['Delivery person reached in ', num2str(count), ' minutes']);
% C = ceil([y_res, y_des])
% R = ceil([x_res, x_des])
% %using bwdistgeodesic
% D1 = bwdistgeodesic(~threshMap, ceil([y_res, y_des]), ceil([x_res, x_des]), 'quasi-euclidean');
% D1(isnan(D1)) = inf;
% paths = imregionalmin(D1);
% %imshow(paths)
% solution_path = bwmorph(paths, 'thin', inf);
% %imshow(solution_path)
% thick_solution_path = imdilate(solution_path, ones(3,3));
% P = imoverlay(threshMap, thick_solution_path, [1 0 0]);
% imshow(P, 'InitialMagnification', 'fit')