#!/bin/bash 

COMPONENT=mongodb

source components/common.sh    # Source loads a file and this file has all the common patterns.

echo -n "Downloading $COMPONENT : "
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $? 
