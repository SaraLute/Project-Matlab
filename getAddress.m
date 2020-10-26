% Open dialog box requesting name and address, then checking what location the address belongs in.

prompt = {'Enter name','Enter Enter address:'};                         % input dialog box for account information
boxName = 'New address';
boxWidth = [1 35];
exampleInput = {'name','address'};
newInput = transpose(inputdlg(prompt,boxName,boxWidth,exampleInput));   % transpose to be able to save it in a structure

mapOfDestination = imread('map_destination.png');
mapOfDestination = im2bw(mat2gray(mapOfDestination), 0.1);
[rows, columns] = find(mapOfDestination);
pos_des = randi(length(columns));
X_des = columns(pos_des);
Y_des = rows(pos_des);

newInput{1,3} = [X_des, Y_des];

addressBook(end+1)=struct('name',newInput(1),'address',newInput(2),'location', newInput(3), 'orders', struct('Restaurant', {},'Products', {}));      % Save the new account to the structure, new row




