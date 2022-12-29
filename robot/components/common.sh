APPUSER=roboshop
LOFGILE="/tmp/$COMPONENT.log"

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
    fi 
}

NODEJS() {
    echo -n "Configuring Node JS:"
    curl -sL https://rpm.nodesource.com/setup_16.x | bash  &>> "${LOFGILE}"
    stat $? 

    echo -n "Installing nodeJs : "
    yum install nodejs -y &>> "${LOFGILE}"
    stat $?  
}