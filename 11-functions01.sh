#!/bin/bash

USERID=(id -u)

VALIDATE(){

    if [$1 -nq 0]
    then 
    echo "$2 ... is failure"
    exit 1
    else
    echo "$2... is sucess"
    fi
}


if  [$USERID -ne 0]
then 
echo "pls run the script with root user"
exit 1
else 
echo "you are super user"
fi


dnf install mysql -y

VALIDATE $? " installing mysql"

dnf install git -y

VALIDATE $? "installing git"
