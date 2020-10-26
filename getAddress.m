% Open dialog box requesting name and address, then checking what location the address belongs in.

prompt = {'Enter name','Enter Enter address:'};                         % input dialog box for account information
boxName = 'New address';
boxWidth = [1 35];
exampleInput = {'name','address'};
newInput = transpose(inputdlg(prompt,boxName,boxWidth,exampleInput));   % transpose to be able to save it in a structure

switch newInput{2}                                                      % switch to connect inserted address to the locations on our map
    case '1'                                                            %   strongly depends on how our map will work. For this basic version
        location = [2,4];                                                   %   the addresses that exist on the map are 1, 2 and 3.
        newInput{1,3}=location;
    case '2'
        location = [4,2];
        newInput{1,3}=location;
    case '3'
        location = [3,3];
        newInput{1,3}=location;
    otherwise
        errordlg('address not in delivery reach','Location Error');    % Show this message when location is not on the map
end


addressBook(end+1)=struct('name',newInput(1),'address',newInput(2),'location', newInput(3), 'orders', struct('Restaurant', {},'Products', {}));      % Save the new account to the structure, new row




