#!/bin/bash 

COMPONENT=mysql

source components/common.sh    # Source loads a file and this file has all the common patterns.

echo -n "Configuring the $COMPONENT repo  : "
curl -s -L -o /etc/yum.repos.d/$COMPONENT.repo https://raw.githubusercontent.com/stans-robot-project/$COMPONENT/main/$COMPONENT.repo  &>> "${LOFGILE}"
stat $? 

echo -n "Installing $COMPONENT: "
yum install mysql-community-server -y   &>> "${LOFGILE}"
stat $? 

echo -n "Starting $COMPONENT : "
systemctl enable mysqld
systemctl start mysqld 
stat $? 

echo -n "Fetching the default password :" 
DEFAULT_ROOT_PWD=$(grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}')


echo -n "Resetting the default root password : "
ALTER USER 'root'@'localhost IDENTIFIED BY new_password;


# 1. Next, We need to change the default root password in order to start using the database service. Use password as `RoboShop@1` . Rest of the options you can choose `No`

# ```bash
# # mysql_secure_installation
# ```

# 1. You can check whether the new password is working or not using the following command in MySQL

# First let's connect to MySQL

# ```bash
# # mysql -uroot -pRoboShop@1
# ```

# Once after login to MySQL prompt then run this SQL Command. This will uninstall the password validation feature like number of characters, password length, complexty and all. As I don’t want that I’d be uninstalling the `validate_password` plugin

# ## **Setup Needed for Application.**

# As per the architecture diagram, MySQL is needed by

# - Shipping Service

# So we need to load that schema into the database, So those applications will detect them and run accordingly.

# To download schema, Use the following command

# ```bash
# # curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
# ```

# Load the schema for mysql. This file contains the list of COUNTRIES, CITIES and their PINCODES. This will be helpful in doing the shipping charges calculation which is based on the distance the product is shippied