#!/bin/bash 
set -e

COMPONENT=catalogue
LOFGILE=/tmp/$COMPONENT

source components/common.sh    # Source loads a file and this file has all the common patterns.

echo -n "Configuring Node JS:"
curl -sL https://rpm.nodesource.com/setup_16.x | bash  
stat $? 
echo -n "Configuring NodeJS Repo :"

echo -n "Creating Application User $APPUSER"
echo &>>${LOGFILE}
useradd $APPUSER  &>>${LOGFILE}
stat $? 


