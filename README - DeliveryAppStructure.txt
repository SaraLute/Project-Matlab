########################################## README - FOOD DELIVERY APP: ##############################################

The following app demonstrates food delivery process that comprises of the following process and the respective parents functions:
1. User following the system and creating an account  (main.m + setupBook.m + getAddress.m)
2. User making an order to a chosen restaurant (getOrder.m + findAccount.m)
3. Selection of a delivery person who is closest to the restaurant (DeliveryMan.m)
4. Tracking the position of delivery person from origin to designated restaurant (Track Delivery.m + DeliveryManProgress.m)
5. Tracking the position of delivery person from restaurant to final address aka destination (Track Delivery.m + DeliveryManProgress.m)
6. Both the parts (4) and (5) report the time taken by the delivery person.

The hierarchy of the program is as follows:

-> main -  Parent program invokes the delivery app
	--> Function : setupBook.m : function that invokes the structure to save the data from the customer + the deliverymen list + restaurant list
	- Welcomes user into system and asks user whether they have an account
	
	--> getAddress : opens a dialog box prompting for name and addres, and then adds coordinates on the map to the address given. Creates new addressBook entry.
	--> getOrder.m : uses menu and listdlg to prompt user to pick a restaurant and food of the corresponding menu. Creates variable theOrder.
	--> findAccount.m : the placed order needs to be connected to the person in the address book. Asks for username, gives option to create account if non-existent and retry when wrong.
	--> DeliveryMan.m : function to locate the available delivery person (DP) #Kaiyu's edit
	
	--> TrackDelivery -  this program is called from the main once the order has been placed and requiste details are taken from the customer
	   - Additionally, contains two maps of the city - (1) for display purposes, (2) binary segmented simplified version for tracking delivery
	   --> Function : DeliveryManProgress.m : function that interacts with TrackDelivery program to track delivery person (DP) from source to destination and reports time taken while plotting his position in real time
		- It takes source and destination coordinates of DP, both (1) and (2) maps of the city, a marker and a string for dsiplay of chosen destination (restaurant or customer)
		- Print the source and destination coordinates on the (1) map and enters a while loop to track position of DP and update it once every min of delivery time
			- For tracking a map (2) is used which contains all the pathways in binary form i.e. 1 (white) for path to take and 0 (black) for empty spaces i.e. line follower concept
			- For every position of DP invoke the following protocol:
				--> Function : desiredDirection : finds a local 3x3 matrix around DP's position and marks desired positions to take in the matrix as 1 and rest 0s.
				--> Function : searchNeighborhood : finds neighborhood pixels in map (2) around DP's current position and returns 1s wherever white pixels are present and vice-versa for black pixels.
				--> Function : computeDirection :  Based on the previous two matrices computes the next position of DP based on three unique cases denotes by a variable flag
					- flag == 0 when one of the available positions is the desired position to take
					- flag == 2 when both the available position are desired positions to take, mostly occurs at corners so here we force a turn
					- flag == 1 when none of the available positions are desired positions to take, mostly occurs when source and edstination are on paralle lines.
						    Here, we force the DP to go along the direction its going till it encounters a turn and then turn the flag to 2.
	- This function DeliveryManProgress.m is invoked twice i.e. for: 
		- (1) trip from delivery person's origin to restaurant; 
		- (2) trip after pick from restaurant to customer's address i.e. destination
	- Finally, calculates the time taken in terms of number steps divided by 20 to give time in minutes.


-> THE END : Go ahead and try our app!!
