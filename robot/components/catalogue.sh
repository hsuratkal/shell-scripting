#!/bin/bash 

COMPONENT=catalogue
source components/common.sh    # Source loads a file and this file has all the common patterns.

echo -n "Configuring Node JS:"
curl -sL https://rpm.nodesource.com/setup_16.x | bash  &>> "${LOFGILE}"
stat $? 

echo -n "Creating Application User $APPUSER :"
useradd $APPUSER  &>> "${LOFGILE}"
stat $? 

echo -n "Downloading the $COMPONENT :" 
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"
stat $? 

echo -n "Extracting the $COMPONENT: "
cd /home/$APPUSER
unzip -o /tmp/$COMPONNET.zip  &>> "${LOFGILE}"



