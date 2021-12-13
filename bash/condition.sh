#!/bin/bash
echo "Enter any number"
read num
if [ $num -le 10 ];
    then
        echo "{1..`num`)}"
    else [ $num -ge 10 ];
        echo "Number is greater then 10"
fi
