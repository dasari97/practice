#!/bin/bash
read ID
if [ $ID == "1000" ];
then
echo "user is $(whoami)"
else
echo "user not found"
fi