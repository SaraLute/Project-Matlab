%The function is used for select the delivery man. 
%input: Currently no input, Since the Restaurant name is given in theOrder.
%output: the location of delivery man who is in charge of the order

%Determine the location of restaurant in the order.
Res = theOrder.Restaurant; 
for k = 1: size(restaurantLocations,2)
    if (Res == restaurantLocations(k).Name)
        ResLocation = restaurantLocations(k).Location;
        break;
    end
end
            

%calculate the distance between every available delivery man and the ordered restaurant.
Distance = zeros(1, size(DMList, 2)); %an array for store distance betweent DM and res.
for i = 1: size(DMList, 2)
    if DMList(i).Availability == true
        DMLocation = DMList(i).Location;
        Distance(i) = sqrt(sum((DMLocation-ResLocation).^2));
    end
end

%Determine the shortest distance and find the corresponding deliveryman.
[ShortestDistance, index] = min(Distance);
DMName = DMList(index).Name;

