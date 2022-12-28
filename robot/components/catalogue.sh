#!/bin/bash 
set -e

COMPONENT=components/catalogue 

cat common.sh 
source common.sh    # Source loads a file and this file has all the common patterns.


echo -n "Configuring NodeJS Repo :"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
yum install nodejs -y  &>> $LOGFILE 
stat $? 

echo -n "Creating Application User $APPUSER"
useradd $APPUSER  &>> $LOGFILE 
stat $? 


