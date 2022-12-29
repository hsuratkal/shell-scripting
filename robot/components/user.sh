#!/bin/bash 

COMPONENT=user
source components/common.sh    # Source loads a file and this file has all the common patterns.

NODEJS                         # Calling NodeJS Function



echo -n "Configuring the $COMPONENT Service:"
sed -i -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' -e 's/MONGO_ENDPOINT/mongo.roboshop.internal/' /home/$APPUSER/$COMPONENT/systemd.service
mv /home/$APPUSER/$COMPONENT/systemd.service  /etc/systemd/system/$COMPONENT.service 
stat $? 

echo -n "Starting $COMPONENT Service :"
systemctl daemon-reload &>> "${LOFGILE}"
systemctl enable $COMPONENT &>> "${LOFGILE}"
systemctl restart $COMPONENT &>> "${LOFGILE}" 
systemctl status $COMPONENT &>> "${LOFGILE}"
stat $? 

 echo -e "\e[32m ______ $COMPONENT Configuration Completed _________ \e[0m"
