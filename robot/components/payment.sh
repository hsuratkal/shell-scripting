#!/bin/bash 

COMPONENT=payment 
source components/common.sh    # Source loads a file and this file has all the common patterns.

PYTHON                         # Calling NodeJS Function

# # 10-Payment

# This service is responsible for payments in RoboShop e-commerce app.

# This service is written on `Python 3`, So need it to run this app.

# CentOS 7 comes with `Python 2` by default. So we need `Python 3` to be installed.

# 1. Install Python 3

# ```sql
# # yum install python36 gcc python3-devel -y
# ```

# 1. Create a user for running the application

# ```sql
# # useradd roboshop
# ```

# 1. Download the repo.

# ```sql
# $ cd /home/roboshop
# $ curl -L -s -o /tmp/payment.zip "https://github.com/stans-robot-project/payment/archive/main.zip"
# $ unzip /tmp/payment.zip
# $ mv payment-main payment
# ```

# 1. Install the dependencies

# ```bash
# # cd /home/roboshop/payment 
# # pip3 install -r requirements.txt
# ```

# ### **Note: Above command may fail with permission denied, So run as root user**

# 1. Update the `roboshop` user id and group id in `payment.ini` file .

# ```sql
# # id roboshop 
# (Copy uid and gid of the user which needs to be updated in the payment.ini file )
# ```

# 1. Update SystemD service file with `CART` , `USER` , `RABBITMQ` Server IP Address.

# ```sql
# # vim systemd.service
# ```

# Update `CARTHOST` with cart server ip

# Update `USERHOST` with user server ip 

# Update `AMQPHOST` with RabbitMQ server ip.

# 1. Setup the service

# ```sql
# # mv /home/roboshop/payment/systemd.service /etc/systemd/system/payment.service
# # systemctl daemon-reload
# # systemctl enable payment 
# # systemctl start payment
# # systemctl status payment -l
# ```

# 1. Now we are good with payment. Update the `PAYMENT` server IP ADDRESS in the FRONTEND Reverse Proxy File

# ```sql
# On FRONTEND,

# # vim /etc/nginx/default.d/roboshop.conf
# # systemctl restart nginx
# ```

# 1. Now we should be able to do the payment.