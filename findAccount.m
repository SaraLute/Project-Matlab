% Once the order is placed. It needs to be connected to a person. This
% script promts the user to fill in their (account)name and checks whether
% it is in the addressBook already. I not the user is asked to retry or
% make new account.

% inputdialog requesting (account)name and storing input as inputName
prompt = {'Enter (account)name: '};
boxName = 'find account';
boxWidth = [1 35];
exampleInput = {'(account)name'};
inputName = inputdlg(prompt,boxName,boxWidth,exampleInput);

% Compares the names in the addressBook to the name stored as inputName
%  When existent the order is saved as a new entry at that account's orders
%  When non-existent the user is asked to retry or make a new account
if (any(strcmp({addressBook.name}, char(inputName))))==1    % compares the names in the addressBook to the name that was inputted here
    disp('Your order is added to your account!')
    next = strcmp({addressBook.name}, char(inputName));
    addressBook(next).orders(end+1) = theOrder;
else
    answer = questdlg('Your name is not in our system. Would you like to retry?', 'Could not find', 'Retry','Make new account', 'Make new account');
    switch answer
        case 'Retry'
            findAccount;
        case 'Make new account'
            getAddress;
    end
end
