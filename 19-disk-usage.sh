#/bin/bash

DISH_USAGE=$(df -hT | grep xfs)
DISK_THRSOLD=6
MESSAGE=""

while IFS= read -r line
do 
USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
FOLDER=$(echo $line | awk -F " " '{print $NF}')
if [ $USAGE -ge $DISK_THRSOLD ]
then
 MESSAGE+="$FOLDER is more than $DISK_THRSOLD, current usage: $USAGE \n"
 fi
done <<< $DISH_USAGE

echo -e  "MESSAGE: $MESSAGE"

