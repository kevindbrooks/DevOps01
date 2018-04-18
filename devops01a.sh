#!/bin/sh

volume_name=`df -h | grep "^/" | awk '{print $1}'`
volume_count=`df -h | grep "^/" | wc | awk '{print $1}'`
volume_size=`df -h | grep "^/" | awk '{print $2}'`
volume_free=`df -h | grep "^/" | awk '{print $4}'`
echo "------------------------------------------------------------------------------------"
echo "Volumes"
echo "There is $volume_count volume(s) ($volume_name) on this machine with $volume_size total space and $volume_free available space"

echo "------------------------------------------------------------------------------------"
echo "CPU details"
lscpu | egrep "^CPU\(s):|Model name|Core|MHz"

echo "------------------------------------------------------------------------------------"
echo "Ram details"
free -m


echo "------------------------------------------------------------------------------------"
echo "Mac Address | IP Address"
ifconfig | head -2

echo "------------------------------------------------------------------------------------"



