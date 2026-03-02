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

for package in $@
 do
 dnf installed $packages &>> $log_file
 if [$? -ne 0];then
 echo "not installed man"
 dnf install $package -y &>> $log_file
 validate $? "$package installation"
 else
 echo "skipping"
 fi

done 