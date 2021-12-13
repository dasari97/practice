#!/bin/bash

if [ $UID == "0" ];
then
echo "user is root"
else
echo "user is not root"
fi