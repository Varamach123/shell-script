#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
VALIDATE(){

    if [ $1 -ne 0 ]
    then 
    echo "$2 ... is failure"
    exit 1
    else
    echo "$2... is sucess"
    fi
}


if  [ $USERID -ne 0 ]
then 
echo "pls run the script with root user"
exit 1
else 
echo "you are super user"
fi


dnf install mysql -y &>>$LOGFILE

VALIDATE $? "installing mysql"

dnf install git -y &>>$LOGFILE

VALIDATE $? "installing git"
