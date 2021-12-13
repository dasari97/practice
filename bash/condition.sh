#!/bin/bash
echo "Enter any number"
read num
if [ num <= 10 ]; then
echo "$num\t"
num=$num+1
else if [ num >=10 ] then
echo "Number is greater then 10"
fi
