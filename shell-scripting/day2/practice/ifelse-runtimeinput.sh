#!/bin/bash

echo "Enter A value : "
read a

echo "Enter B value : "
read b


if [ $a -gt $b ]
then
    echo "a is big number"
elif [ $a -eq $b ]
then
    echo "both numbers are equal"
else
    echo "b is big number"    
fi