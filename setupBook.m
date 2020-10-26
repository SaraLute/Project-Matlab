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

%Following code is used for creating a structure for the information of
%location of restaurants.
restaurantLocations(1) = struct('Name', 'Sushi place', 'Location', [3.3 5]);
restaurantLocations(2) = struct('Name', 'Pizza place', 'Location', [4 2]);
restaurantLocations(3) = struct('Name', 'Thai place', 'Location', [2.1 6]);
restaurantLocations(4) = struct('Name', 'Burger place', 'Location', [5 1.8]);
restaurantLocations(5) = struct('Name', 'Expensive place', 'Location', [3.9 2.7]);
 