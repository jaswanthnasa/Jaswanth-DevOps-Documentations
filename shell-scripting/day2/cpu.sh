#!/bin/bash

MAX=10
EMAIL=jassu.563@gmail.com

#USE=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}') | awk -F '.' '{print $1}'

USE=$((grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}') | awk -F '.' '{print $1}')

#echo "current cpu usage is :" $(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}') | awk -F '.' '{print $1}'

echo "current cpu usage is :" $USE

echo "max cpu threshold  is :" $MAX



if [ $USE > $MAX ]
# if [ 36 > 10 ]
#if [ "$USE" -gt "$MAX" ]
then
	echo "Percent used: $USE" | mail -s "Running out of CPU power" $EMAIL
    echo " code red "
else
    echo "all good just relax !!! "    
fi
