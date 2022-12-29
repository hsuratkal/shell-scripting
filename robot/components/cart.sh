#!/bin/bash 

COMPONENT=cart
source components/common.sh    # Source loads a file and this file has all the common patterns.

NODEJS                         # Calling NodeJS Function


echo -n "Configuring the $COMPONENT Service:"
sed -i  /home/$APPUSER/$COMPONENT/systemd.service
mv /home/$APPUSER/$COMPONENT/systemd.service  /etc/systemd/system/$COMPONENT.service 
stat $? 

