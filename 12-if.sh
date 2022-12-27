#!/bin/bash 

# a="ABC"

# If Condition
# if [ "$a" == "xyz" ]; then 
#     echo -e "\e[32m Both of the are equal \e[0m"

# fi 

# If else condition

# if [ "$a" == "xyz" ]; then 
#     echo -e "\e[32m Both of the are equal \e[0m"
#     exit 0

# else 
#     echo -e "\e[31m Both of the are not equal \e[0m"
#     exit 1 
# fi 

# Note :  Use ``==`` when you're dealing with strings, use -eq when dealing with numbers.

# Demo on else if 

c=$1 

if [ "$c" -eq "10" ] ; then  
    echo "value is c 10"

elif [ "$c" -eq "20" ] ; then  
    echo " value is c 30"

elif [ "$c" -eq "30" ] ; then  
    echo "value is c 30"

else  
    echo "value is not 10 or 20 or 30" 
    exit 100 
fi 