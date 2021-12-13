#!/bin/bash
echo "Enter any number"
read num
if [ $num -ge 10 ];
    then
        echo "{$num..1}"
    else [ $num -le 10 ];
        echo "Number is greater then 10"
fi
