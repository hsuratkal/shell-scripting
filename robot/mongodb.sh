#!/bin/bash 
set -e

COMPONENT=mongodb
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
}

echo -n "Donwloading $COMPONENT : "
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $? 

echo -n "Installing $COMPONENT : "
yum install -y mongodb-org  &>> $LOFGILE

echo -n "Starting $COMPONENT : "
systemctl enable mongod
systemctl start mongod
stat $? 

echo -n "Downloading the $COMPONENT Schema : "
curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
stat $? 

echo -n "Extracting the $COMPONENT Schema file:"
cd /tmp
unzip mongodb.zip  &>> $LOFGILE
stat $? 

echo -n "Injecting the Schema : "
cd mongodb-main
mongo < catalogue.js &>> $LOFGILE
mongo < users.js     &>> $LOFGILE
stat $? 

