% getOrder let's the user pick a restaurant and choose an order there.

%   starting with a menu box prompting the user to pick a restaurant
restaurantOptions = {'Sushi place', 'Pizza place','Thai place','Burger place','Expensive place'};
restaurantBox = menu('These are the restaurants you can eat at: ', restaurantOptions);
message = sprintf('You chose the %s !', restaurantOptions{restaurantBox});
uiwait(msgbox(message));            %uiwait blocks execution and waits to resume


%   Then depending on the restaurant choice, the user is led into an
%   listdialog to choose the food from the corresponding menu. Outputting
%   the order to the command window.
if restaurantBox == 1 
    list = {'salmon roll', 'ebi roll', 'tuna sashimi', 'edame beans', 'grilled veggies', 'noodles','tomato soup'};
    [indx,tf] = listdlg('ListString',list);
    new_order =1;
    if (tf == 1)
        msgbox('Thank you for ordering! You can find your order in the command window');
        disp ("Your order:");
        for i = 1:numel (indx)
            fprintf("\t%s\n", list{indx(i)});   %\t(horizontal tab), &s(char vector or string array), \n(new line)
        end
        
    else
        msgbox ('You cancelled');
    end
elseif restaurantBox == 2
    list = {'margarita', 'mozarella', 'hawaii'};
    [indx,tf] = listdlg('ListString',list);
    
    if (tf == 1)
        msgbox('Thank you for ordering! You can find your order in the command window');
        disp ("Your order:");
        for i = 1:numel (indx)
            fprintf("\t%s\n", list{indx(i)});   %\t(horizontal tab), &s(char vector or string array), \n(new line)
        end
    else
        msgbox ('You cancelled');
    end
elseif restaurantBox == 3
    list = {'thai menu 1', 'thai menu 2', 'thai menu 3'};
    [indx,tf] = listdlg('ListString',list);
    
    if (tf == 1)
        msgbox('Thank you for ordering! You can find your order in the command window');
        disp ("Your order:");
        for i = 1:numel (indx)
            fprintf("\t%s\n", list{indx(i)});   %\t(horizontal tab), &s(char vector or string array), \n(new line)
        end
    else
        msgbox ('You cancelled');
    end
elseif restaurantBox == 4
    list = {'hamburger', 'cheeseburger', 'fries'};
    [indx,tf] = listdlg('ListString',list);
    
    if (tf == 1)
        msgbox('Thank you for ordering! You can find your order in the command window');
        disp ("Your order:");
        for i = 1:numel (indx)
            fprintf("\t%s\n", list{indx(i)});   %\t(horizontal tab), &s(char vector or string array), \n(new line)
        end
    else
        msgbox ('You cancelled');
    end
else
    list = {'truffle risotto', 'entrecote with aubergine tartar', 'vegan option'};
    [indx,tf] = listdlg('ListString',list);
    
    if (tf == 1)
        msgbox('Thank you for ordering! You can find your order in the command window');
        disp ("Your order:");
        for i = 1:numel (indx)
            fprintf("\t%s\n", list{indx(i)});   %\t(horizontal tab), &s(char vector or string array), \n(new line)
        end
    else
        msgbox ('You cancelled');
    end
end


% Lastly, the getOrder script creates a variable theOrder which stores the
% chosen restaurant and food products. With the findAccount script this
% order is connected to an account. When running/ordering again the
% variable is overwritten.
theOrder = struct('Restaurant', restaurantOptions{restaurantBox}, 'Products', {list(indx)});    %save the order to a structure
