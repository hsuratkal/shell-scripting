#!/bin/bash 

a="ABC"

# If Condition
# if [ "$a" == "xyz" ]; then 
#     echo -e "\e[32m Both of the are equal \e[0m"

# fi 

# If else condition

if [ "$a" == "xyz" ]; then 
    echo -e "\e[32m Both of the are equal \e[0m"

else 
    echo -e "\e[31m Both of the are not equal \e[0m"
fi 