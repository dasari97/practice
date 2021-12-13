#!/bin/bash
echo "Enter any number"
read num
if [ num -ge 10 ]; then
echo "$num\t"
num=$num+1
else [ num -le 10 ]; then
echo "Number is greater then 10"
fi
