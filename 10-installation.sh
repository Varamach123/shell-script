#!/bin/bash


USERID=$(id -u)
 if [$USERID -ne 0]
 then 
 echo "pls run the script with root user"
 exit 1
 else
  echo "you are super user"
  fi 

  dnf install mysql -y
  if [$? -ne 0]
  then 
  echo "installation is failure"
  exit 1
  else 
  echo "installation of mysql is sucess"
  fi 
  dnf install git -y
  if [$? -ne 0]
  then 
  echo "installation of mysql is sucess"
  exit 1
  else 
  echo "installation is sucess"
  fi
