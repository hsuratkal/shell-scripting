#!/bin/bash 


# Special Variable are pre-defined, which means you cannot create them, you can only use them.
# Here are few of the special variables.

###   $0 to $n , $*  $& $#  $? 

# $0       : Prints the script name 
# $?       : Shows the exit code of the previous command  
# $1 to $9 : command line variables ; ex : sh test.sh  100 200 300 
# $* or $@ : Prints all the variables used in this script
# $#       : Prints the number variables used in this script
# In linux apart from A to Z or a to z or 0 to  9 are special characters 

a=$1 
b=$2 

# ex :  sh test.sh  100   200 

echo "Name of the script is : $0 "
echo "Value of a is : $a "
echo "Value of b is : $b "
echo "Here are the variables used in the script :  $*"
echo "Number of variables used in the script : $# "