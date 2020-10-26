% The main of delivery processing
% Here first the coorindates of delivery man, restaurant and destination
% are provided and it calls a single function to track delivery man for both parts of the journey:
% 1. DeliveryManToRestuarant 
% 2. RestaurantToDestination

% Reading two maps of the city, one for display, other (black and white) for processing
mapToProcess = imread('sample_map.png');
[mapOfCity, colorOfMap] = imread('city_map.png');
TrajectoryMap = im2bw(mat2gray(mapToProcess), 0.1);
[rowsBP, columnsBP] = find(TrajectoryMap);

% 1. Here we pass the coorindates of delivery man, restaurant and the map to tracking
% function
[X_res, Y_res, t1] = DeliveryManProgress(DMLocation(1), DMLocation(2), ResLocation(1), ResLocation(2), TrajectoryMap, mapOfCity, colorOfMap, 'xb', 'restaurant');

% 2. Here we pass the coordinates of delivery man at restaurant and destination with a map to tracking
% function
[X_des, Y_des, t2] = DeliveryManProgress(ResLocation(1), ResLocation(2), X_des, Y_des, TrajectoryMap, mapOfCity, colorOfMap, 'or', 'destination');


disp('Thanks for ordering, Eetsmakelijk!');