#!/bin/bash
# his script demonstrates testing to see if 2 strings are the same
# it also demonstrates using conditional execution

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data (i.e. TestString)
# TASK 2: Improve it by rewriting it to use the if command
#         The if cnd should test if they got it right, in which case it should tell them they got it right
#         The f command should tell them they got it wrong
# TASK 3: Improve it by giving them 5 tries to get it right before failing
#           *** Do not use the exit command, and do not use a loop (e.g. while or for)


#7 chances are given to user to enter correct password for login

#read command for capaturing the input
read -p "enter password to login " refernceString

myString="yug123"
# camparison of string
if [ "$refernceString" == "$myString" ]; then
  echo "correct password , welcome"
	 
else 
  read -p "please enter your password again" refernceString 




	 if [ "$refernceString" == "$myString" ]; then
                         echo "correct password , welcome"

         else
            read -p "please enter your password again" refernceString 
		
        	 if [ "$refernceString" == "$myString" ]; then
                         echo "correct password , welcome"

                    else
                         read -p "please enter your password again" refernceString 
		    
    	            
                 	 if [ "$refernceString" == "$myString" ]; then


	                  echo "correct password , welcome"

                         else
                            read -p "please enter your password again" refernceString


			

				if [ "$refernceString" == "$myString" ]; then


                			 echo "correct password , welcome"

 				
     				else                   	
                                	 echo "sorry you have alredy entered 5 times wrong password, your account is blocked"   
				fi
			fi


		fi

	fi
fi
		
