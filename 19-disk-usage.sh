#/bin/bash

DISH_USAGE=$(df -hT | grep xfs)
DISK_THRSOLD=6

while IFS= read -r line
do 
USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
FOLDER=$(echo $line | awk -F " " '{print $NF}')
if [ $USAGE -ge $DISK_THRSOLD ]
then
 echo " $FOLDER is more than $DISK_THRSOLD, current usage: $USAGE "
 fi
done <<< $DISH_USAGE

