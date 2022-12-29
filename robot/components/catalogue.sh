#!/bin/bash 

COMPONENT=catalogue
source components/common.sh    # Source loads a file and this file has all the common patterns.

NODEJS                         # Calling NodeJS Function






echo -n "Installing $COMPONENT Dependencies :"
cd $COMPONENT 
npm install  &>> "${LOFGILE}" 
stat $? 

echo -n "Configuring the $COMPONENT Service:"
sed -i -e  's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/$APPUSER/$COMPONENT/systemd.service
mv /home/$APPUSER/$COMPONENT/systemd.service  /etc/systemd/system/$COMPONENT.service 
stat $? 

echo -n "Starting $COMPONENT Service :"
systemctl daemon-reload &>> "${LOFGILE}"
systemctl enable $COMPONENT &>> "${LOFGILE}"
systemctl restart $COMPONENT &>> "${LOFGILE}" 
systemctl status $COMPONENT &>> "${LOFGILE}"
stat $? 

 echo -e "\e[32m ______ $COMPONENT Configuration Completed _________ \e[0m"
