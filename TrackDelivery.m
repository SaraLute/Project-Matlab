% The main of delivery processing
% Here first the coorindates of delivery man, restaurant and destination
% are provided and it calls a single function to track delivery man for both parts of the journey:

clc;
clear all;
close all;

mapOfCity = imread('sample_map.png');
TrajectoryMap = im2bw(mat2gray(mapOfCity), 0.1);
[rowsBP, columnsBP] = find(TrajectoryMap);

% Here we select delivery man, restaurant and destination using a random
% function, this to be replaced by specific coordinates provided by
% Sara/Kaiyu
% First - Delivery man
mapOfDeliveryMan = imread('map_delivery_man.png');
mapOfDeliveryMan = im2bw(mat2gray(mapOfDeliveryMan), 0.1);
[rows, columns] = find(mapOfDeliveryMan);
pos_del = randi(length(columns));
X_del = columns(pos_del);
Y_del = rows(pos_del);

mapOfRestaurant = imread('map_restaurants.png');
mapOfRestaurant = im2bw(mat2gray(mapOfRestaurant), 0.1);
[rows, columns] = find(mapOfRestaurant);
pos_res = randi(length(columns));
X_res = columns(pos_res);
Y_res = rows(pos_res);

mapOfDestination = imread('map_destination.png');
mapOfDestination = im2bw(mat2gray(mapOfDestination), 0.1);
[rows, columns] = find(mapOfDestination);
pos_des = randi(length(columns));
X_des = columns(pos_des);
Y_des = rows(pos_des);

% Here we pass the coorindates of delivery man and restaurant to tracking
% function
[X_res, Y_res, t1] = DeliveryManProgress(X_del, Y_del, X_res, Y_res, TrajectoryMap, 'xb', 'restaurant');

% Here we pass the coordinates of delivery man at restaurant and destination to tracking
% function
[X_des, Y_des, t2] = DeliveryManProgress(X_res, Y_res, X_des, Y_des, TrajectoryMap, 'or', 'destination');