% Once the order is placed. It needs to be connected to a person.

prompt = {'Enter (account)name: '};
boxName = 'find account';
boxWidth = [1 35];
exampleInput = {'(account)name'};
inputName = inputdlg(prompt,boxName,boxWidth,exampleInput);

if (any(strcmp({addressBook.name}, char(inputName))))==1    % compares the names in the addressBook to the name that was inputted here
    disp('it works')
%    addressBook.orders(end+1) = theOrder;
     addressBook.orders(end+1) = theOrder;
%     b = theOrder;
%     addressBook.orders.order1 = b;    
%     orderLocation = addressBook.orders(end+1);
%     save(theOrder, 'orderLocation');
    % addressBook = struct
    % Save theOrder to the field Orders of the addressBook
    % addressBook.orders(2) = 'wauw';    addressBook.orders(end+1) = char(inputName);
else
    answer = questdlg('Your name is not in our system. Would you like to retry?', 'Could not find', 'Retry','Make new account', 'Make new account');
    switch answer
        case 'Retry'
            findAccount;
        case 'Make new account'
            getAddress;
    end
    
end