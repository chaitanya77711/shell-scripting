#!/bin/bash

userid=$(id -u)
log_folder="/var/log/shell-script"
log_file="/var/log/shell-script/$0.log"

if [ $userid -ne 0 ]; then
   echo "please run with root user" |tee -a $log_file
   exit 1
fi 

validate(){
    if [ $1 -ne 0 ]; then
    echo "$2 failure" | tee -a $log_file
    exit 1

    else
       echo " $2 success adi ra abbbai" | tee -a $log_file
    fi
} 

dnf install nginx -y &>> $log_file
validate $? "installing nginx"

dnf install mysql -y &>> $log_file
validate $? "installing mysql"

