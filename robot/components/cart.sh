#!/bin/bash 

COMPONENT=cart
source components/common.sh    # Source loads a file and this file has all the common patterns.

NODEJS                         # Calling NodeJS Function


echo -n "Cleanup and Extraction $COMPONENT: "
rm -rf /home/${APPUSER}/${COMPONENT}/
cd /home/$APPUSER
unzip -o /tmp/${COMPONENT}.zip  &>> "${LOFGILE}"
stat $? 

echo -n "Changing the ownership to $APPUSER"
mv /home/$APPUSER/$COMPONENT-main /home/$APPUSER/$COMPONENT
chown -R $APPUSER:$APPUSER /home/$APPUSER/$COMPONENT
stat $?

echo -n "Installing $COMPONENT Dependencies :"
cd $COMPONENT 
npm install  &>> "${LOFGILE}" 
stat $? 

echo -n "Configuring the $COMPONENT Service:"
sed -i -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' -e 's/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/' /home/$APPUSER/$COMPONENT/systemd.service
mv /home/$APPUSER/$COMPONENT/systemd.service  /etc/systemd/system/$COMPONENT.service 
stat $? 

echo -n "Starting $COMPONENT Service :"
systemctl daemon-reload &>> "${LOFGILE}"
systemctl enable $COMPONENT &>> "${LOFGILE}"
systemctl restart $COMPONENT &>> "${LOFGILE}" 
systemctl status $COMPONENT &>> "${LOFGILE}"
stat $? 

 echo -e "\e[32m ______ $COMPONENT Configuration Completed _________ \e[0m"
