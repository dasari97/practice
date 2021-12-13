#!/bin/bash

if [ $UID =! 0 ];
then
echo "user is not root"
else
echo "user is root"
fi