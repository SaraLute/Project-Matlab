% The main of delivery processing
% Here first the coorindates of delivery man, restaurant and destination
% are provided and it calls a single function to track delivery man for both parts of the journey:
% 1. DeliveryManToRestuarant 
% 2. RestaurantToDestination

mapOfCity = imread('sample_map.png');
TrajectoryMap = im2bw(mat2gray(mapOfCity), 0.1);
[rowsBP, columnsBP] = find(TrajectoryMap);


% Here we pass the coorindates of delivery man and restaurant to tracking
% function
[X_res, Y_res, t1] = DeliveryManProgress(DMLocation(1), DMLocation(2), ResLocation(1), ResLocation(2), TrajectoryMap, 'xb', 'restaurant');

% Here we pass the coordinates of delivery man at restaurant and destination to tracking
% function
[X_des, Y_des, t2] = DeliveryManProgress(ResLocation(1), ResLocation(2), X_des, Y_des, TrajectoryMap, 'or', 'destination');
