% getAddress requests user input on account information

% Input dialogbox prompting for name and addres of user. And storing said
%  input in variable newInput. (transposed to save in a structure)
prompt = {'Enter name','Enter Enter address:'};                         % input dialog box for account information
boxName = 'New address';
boxWidth = [1 35];
exampleInput = {'name','address'};
newInput = transpose(inputdlg(prompt,boxName,boxWidth,exampleInput));   % transpose to be able to save it in a structure

% Inputted addres is connected to a location on the map. A randomly
% generated set of x,y-coordinates is saved as X_des and Y_des.
mapOfDestination = imread('map_destination.png');
mapOfDestination = im2bw(mat2gray(mapOfDestination), 0.1);
[rows, columns] = find(mapOfDestination);
pos_des = randi(length(columns));
X_des = columns(pos_des);
Y_des = rows(pos_des);

newInput{1,3} = [X_des, Y_des];


% Storing the newly created account information as a new entry in the
% addressBook. Including an empty structure field for the orders.
addressBook(end+1)=struct('name',newInput(1),'address',newInput(2),'location', newInput(3), 'orders', struct('Restaurant', {},'Products', {}));
