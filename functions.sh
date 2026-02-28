#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
   echo "please run with root user"
   exit 1
fi 

validate(){
    if [ $1 -ne 0 ]; then
    echo "$2 failure"
    exit 1

    else
       echo " $2 success adi ra abbbai"
    fi
} 

dnf install Nginx -y
validate $? "installing Nginx"

dnf install Mysql -y
validate $? "installing Mysql"

