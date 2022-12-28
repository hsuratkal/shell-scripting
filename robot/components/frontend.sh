#!/bin/bash 

set -e

COMPONENT=frontend
LOFGILE=/tmp/$COMPONENT.log

source components/common.sh    # Source loads a file and this file has all the common patterns.

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
unzip /tmp/$COMPONENT.zip  &>>${LOGFILE} 
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
