#!/bin/bash 


# Special Variable are pre-defined, which means you cannot create them, you can only use them.
# Here are few of the special variables.

###   $0 to $n , $*  $& $#  $? 

# $0       : Prints the script name 
# $?       : Shows the exit code of the previos command  
# $1 to $9 : command line variables ; ex : sh test.sh  100 200 300 
# $*       : Prints all the variables used in this script

a=$1 
b=$2 

# ex :  sh test.sh  100   200 

echo "Name of the script is : $0 "
echo "Value of a is : $a "
echo "Value of b is : $b "
echo "Here are the variables used in the script :  $*"
echo $# 
echo $@ 