#!/bin/bash
echo "enteruser ID  to check user name:" 
read ID
user name is $(id $ID | awk {'print $1'})