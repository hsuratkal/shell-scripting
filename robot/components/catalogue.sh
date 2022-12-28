#!/bin/bash 
set -e

COMPONENT=catalogue 

source components/common.sh    # Source loads a file and this file has all the common patterns.


echo -n "Configuring Node JS:"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -   &>> /tmp/$COMPONENT.log
stat $? 
echo -n "Configuring NodeJS Repo :"

echo -n "Creating Application User $APPUSER"
useradd $APPUSER  &>> $LOGFILE 
stat $? 


