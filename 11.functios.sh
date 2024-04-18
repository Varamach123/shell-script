#!/bin/bash


USERID=$(id -u)

VALIDATE () {
    echo "exit status : $1"
    echo "who are you : $2"

}



 if [$USERID -ne 0]
 then 
 echo "pls run the script with root user"
 exit 1
 else
  echo "you are super user"
  fi 

  dnf install mysql -y
  VALIDATE $? "Installing my sql :"
  
  dnf install git -y
  VALIDATE $? "Installing my sql :"
  
