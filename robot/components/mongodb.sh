#!/bin/bash 

COMPONENT=mongodb

source components/common.sh    # Source loads a file and this file has all the common patterns.

echo -n "Downloading $COMPONENT : "
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $? 

echo -n "Installing $COMPONENT : "
yum install -y mongodb-org   &>> "${LOFGILE}"

echo -n "Updating the mongodb"
sed -i -e  's/127.0.0.1/0.0.0.0/' mongod.conf

echo -n "Starting $COMPONENT : "
systemctl enable mongod
systemctl start mongod
stat $? 

echo -n "Downloading the $COMPONENT Schema : "
curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
stat $? 

echo -n "Extracting the $COMPONENT Schema file:"
cd /tmp
unzip -o mongodb.zip   &>> "${LOFGILE}"
stat $? 

echo -n "Injecting the Schema : "
cd mongodb-main
mongo < catalogue.js  &>> "${LOFGILE}"
mongo < users.js      &>> "${LOFGILE}"
stat $? 

