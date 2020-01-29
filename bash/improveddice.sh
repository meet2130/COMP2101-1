#!/bin/bash

#

# this script rolls a pair of six-sided dice and displays both the rolls

#



# Task 1:

#  put the number of sides in a variable which is used as the range for the random number

#  put the bias, or minimum value for the generated number in another variable

#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias



# Task 2:

#  generate the sum of the dice

#  generate the average of the dice



#  display a summary of what was rolled, and what the results of your arithmetic were





#declaring the value of the bias and sides



bias=1



sides=6





# Tell the user we have started processing

echo "Rolling..."

# roll the dice and save the results

die1=$(( RANDOM % 6 + 1))

die2=$(( RANDOM % 6 + 1 ))

# display the results

echo "Rolled $die1, $die2"


#  Adding the result of die1 and die2



sum=$(( die1 + die2 ))


# Getting average of the dias



average=$(echo $sum/2 | bc -l)


#Displaying the result and pausing the process for 3 seconds


sleep 1


echo "Rolled $die1, $die2 for a $sum"


sleep 1


echo "Rolled $die1, $die2 and the average is $average"
