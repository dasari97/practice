#!/bin/bash

if [ $UID == "1000" ];
then
echo "user is $(whoami)"
else
echo "user not found"
fi