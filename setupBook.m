% set-up of structure addressBook

addressBook=struct('name','Name','address','Address','location', [1,1], 'orders', struct('Restaurant', {},'Products', {}));


% % Brute force means to fix coordinates of the deliveryman - just run once
% mapOfDeliveryMan = imread('map_delivery_man.png');
% mapOfDeliveryMan = im2bw(mat2gray(mapOfDeliveryMan), 0.1);
% [rows, columns] = find(mapOfDeliveryMan);
% pos_del = randi(length(columns), 7, 1);
% X_del = columns(pos_del);
% Y_del = rows(pos_del);


%Following code is used for creating a list of deliverymen.
%In Practice, "Location" is updated automatically by GPS information,
%"Availability" is set by deliverymen themselves.
DMList(1) = struct('Name','Allen', 'Location', [43 54], 'Availability', 1);
DMList(2) = struct('Name','Bob', 'Location', [301 54], 'Availability', 1);
DMList(3) = struct('Name','Carol', 'Location', [383 448], 'Availability', 1);
DMList(4) = struct('Name','Dion', 'Location', [41 390], 'Availability', 0);
DMList(5) = struct('Name','Edward', 'Location', [41 232], 'Availability', 1);
DMList(6) = struct('Name','Ferry', 'Location', [69 54], 'Availability', 1);
DMList(7) = struct('Name','Gosline', 'Location', [86 54], 'Availability', 1);



% % Brute force means to fix coordinates of the restaurants - just run once
% mapOfRestaurant = imread('map_restaurants.png');
% mapOfRestaurant = im2bw(mat2gray(mapOfRestaurant), 0.1);
% [rows, columns] = find(mapOfRestaurant);
% pos_res = randi(length(columns), 5, 1);
% X_res = columns(pos_res);
% Y_res = rows(pos_res);


%Following code is used for creating a structure for the information of
%location of restaurants.
restaurantLocations(1) = struct('Name', 'Sushi place', 'Location', [641 524]);
restaurantLocations(2) = struct('Name', 'Pizza place', 'Location', [628 744]);
restaurantLocations(3) = struct('Name', 'Thai place', 'Location', [487 524]);
restaurantLocations(4) = struct('Name', 'Burger place', 'Location', [752 546]);
restaurantLocations(5) = struct('Name', 'Expensive place', 'Location', [679 524]);



% % display restaurants - can be commented after one time use
% figure(1);
% imshow(mapOfRestaurant);
% hold on;
% plot(X_res,Y_res,'og','MarkerSize', 15, 'LineWidth', 4);

