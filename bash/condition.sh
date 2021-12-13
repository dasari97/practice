#!/bin/bash
echo "enteruser ID  to check user name:" 
read ID
echo "User name is $(id $ID | awk {'print $1'})"