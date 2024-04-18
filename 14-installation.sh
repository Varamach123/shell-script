#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%s)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31M"
G="\e[32M"
Y="\e[33M"
N="\e[0M"


VALIDATE(){

    if [$1 -ne 0]
    then 
    echo -e "$2..... $R failure $N"
    exit 1
    else 
    echo -e  "$2.... $G sucuss $N"
    fi
}

if [$USERID -ne 0]
then 
echo "you need to have root user access"
exit 1
else
echo "you are root user"
fi

for i in $@
do 
echo "install package $i"
dnf list installed $i &>>$LOGFILE
if [ $? -eq 0 ]
then
 echo  -e "$1 is already installed ... $Y skipped $N"

else 
dnf install $1 -y &>>$LOGFILE
VALIDATE $? "installation of $i"
fi 
done