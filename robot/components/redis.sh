#!/bin/bash 

COMPONENT=mongodb

source components/common.sh    # Source loads a file and this file has all the common patterns.

echo -n "Downloading $COMPONENT : "
curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
# yum install redis-6.2.7 -y
