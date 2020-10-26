setupBook

disp('Hello, and welcome to this food ordering system.');
disp(' ');
action = input('Do you have an account? [Y|N]' , 's');

switch action
    case 'N'
        getAddress
        disp('Thanks for signing up!');
        action2 = input('Do you want to order now? [Y|N]', 's');
        switch action2
            case 'Y'
                disp('Then let`s go get your order!');
                getOrder
                findAccount
                DeliveryMan
                TrackDelivery
            case 'N'
                disp('Thanks for visiting the system, goodbye!');
            otherwise
                disp('This is not an option..');
        end
    case 'Y'
        disp('Then let`s go get your order!');
        getOrder
        findAccount
        DeliveryMan
        TrackDelivery
    otherwise
        disp('This is not an option..');
end
