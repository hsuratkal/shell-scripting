#!/bin/bash 

# DATE="24-12-2022"   # HardCoding the value
DATE=$(date +%F)      # Deeclaring expression to the variab;e
echo "Good Morning, today's date is $DATE"  
echo "Total number of opened sessions is $(who | wc -l)"


# Always fetch the information dynamically for the variable which keep on changing, hardcoding creates complexity

# () : Paranthesis      : Expressions should be enclused in paranthesis 
# {} : Flower Brackets
# [] : Square Brackets 