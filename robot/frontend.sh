#!/bin/bash 

set -e

COMPONENT=frontend
LOFGILE=/tmp/$COMPONENT.log

ID=$(id -u)
if [ $ID -ne 0 ] ; then 
    echo -e "\e[31m You need to script either as a root user or with a sudo privilege \e[0m"
    exit 1
fi 

stat() {
    if [ $1 -eq 0 ]; then 
        echo -e "\e[32m Success \e[0m "
    else 
        echo -e "\e[31m failure \e[0m"
    fi 
}

echo -e "\e[32m ______ $COMPONENT Configuration is Starting  _________ \e[0m"


echo -n "Installing Nginx :"
yum install nginx -y    &>>  $LOFGILE
stat $? 

echo -n "Downloading the $COMPONENT :"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "Clearing the default content : "
cd /usr/share/nginx/html
rm -rf *   &>>  $LOFGILE
stat $? 

echo -n "Extracting $COMPONENT : "
unzip /tmp/$COMPONENT.zip &>> /tmp/$COMPONENT.log 
stat $? 

echo -n "Copying $COMPONENT :"
mv frontend-main/* .  &>>  $LOFGILE
mv static/* .         &>>  $LOFGILE 
rm -rf frontend-main README.md  &>> /tmp/frontend.log 
mv localhost.conf /etc/nginx/default.d/roboshop.conf  &>>  $LOFGILE
stat $? 

echo -n "Retarting Nignx :"
systemctl enable nginx   &>>  $LOFGILE
systemctl restart nginx  &>>  $LOFGILE
stat $?

echo -e "\e[32m ______ $COMPONENT Configuration Completed _________ \e[0m"
