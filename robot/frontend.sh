#!/bin/bash 

ID=$(id -u)
if [ $ID -ne 0 ] ; then 
    echo -e "\e[31m You need to script either as a root user or with a sudo privilege \e[0m"
    exit 1
fi 

echo "Installing Nginx :"
yum install nginx -y    &>> /tmp/frontend.log 
if [ $? -eq 0 ]; then 
    echo -e "\e[32m Success \e[0m "
else 
    echo "\e[31m failure \e[0m"
fi 


echo "Starting Nignx :"
systemctl enable nginx  &>> /tmp/frontend.log 
systemctl start nginx   &>> /tmp/frontend.log 
if [ $? -eq 0 ]; then 
    echo -e "\e[31m Success \e[0m "
else 
    echo "\e[32m failure \e[0m"
fi 
