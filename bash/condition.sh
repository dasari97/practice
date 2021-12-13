#!/bin/bash
echo "enteruser ID  to check user name:\n" 
read ID
if [ $ID == "1000" ];
then
echo "user is $(whoami)"
else
echo "user not found"
fi