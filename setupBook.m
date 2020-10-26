% set-up of structure addressBook
%       

addressBook=struct('name','Name','address','Address','location', [1,1], 'orders', struct('Restaurant', {},'Products', {}));

%Following code is used for creating a list of deliverymen.
%In Practice, "Location" is updated automatically by GPS information,
%"Availability" is set by deliverymen themselves.
DMList(1) = struct('Name','Allen', 'Location', [1 3], 'Availability', 1);
DMList(2) = struct('Name','Bob', 'Location', [2 5], 'Availability', 1);
DMList(3) = struct('Name','Carol', 'Location', [3.2 4.8], 'Availability', 1);
DMList(4) = struct('Name','Dion', 'Location', [3 1.8], 'Availability', 0);
DMList(5) = struct('Name','Edward', 'Location', [5 3], 'Availability', 1);
DMList(6) = struct('Name','Ferry', 'Location', [2.1 6], 'Availability', 1);
DMList(7) = struct('Name','Gosline', 'Location', [4 3.7], 'Availability', 1);

% Brute force means to fix coordinates of the restaurants - just run once
mapOfRestaurant = imread('map_restaurants.png');
mapOfRestaurant = im2bw(mat2gray(mapOfRestaurant), 0.1);
[rows, columns] = find(mapOfRestaurant);
pos_res = randi(length(columns), 5, 1);
X_res = columns(pos_res);
Y_res = rows(pos_res);

%Following code is used for creating a structure for the information of
%location of restaurants.
restaurantLocations(1) = struct('Name', 'Sushi place', 'Location', [X_res(1) Y_res(1)]);
restaurantLocations(2) = struct('Name', 'Pizza place', 'Location', [X_res(2) Y_res(2)]);
restaurantLocations(3) = struct('Name', 'Thai place', 'Location', [X_res(3) Y_res(3)]);
restaurantLocations(4) = struct('Name', 'Burger place', 'Location', [X_res(4) Y_res(4)]);
restaurantLocations(5) = struct('Name', 'Expensive place', 'Location', [X_res(5) Y_res(5)]);

% display restaurants - can be commented after one time use
figure(1)
imshow(mapOfRestaurant)
hold on
plot(X_res,Y_res,'og','MarkerSize', 15, 'LineWidth', 4);

 