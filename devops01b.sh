#!/bin/sh

volume_name=`df -h | grep "^/" | awk '{print $1}'`
volume_count=`df -h | grep "^/" | wc | awk '{print $1}'`
volume_size=`df -h | grep "^/" | awk '{print $2}'`
volume_free=`df -h | grep "^/" | awk '{print $4}'`

echo "Please input Y for each system check you want to see or press enter to skip"
########################################
#read -p "Would you like to see ALL ? " name5
read -p "Volumes ? " name1
read -p "CPU ? " name2
read -p "RAM ? " name3
read -p "Network ? " name4
read -p "ALL ? " name5
echo ""
########################################
if [ "$name1" = "Y" ];
then
        echo "*****VOLUMES*****"
                        echo "There is $volume_count volume(s) ($volume_name) on this machine with $volume_size total space and $volume_free available space"
        echo ""
else
        echo "Volumes skipped"
        break
fi
########################################
if [ "$name2" = "Y" ];
then
        echo "*****CPU*****"
        lscpu | egrep "^CPU\(s):Model name|Core|MHz"
        echo ""
else
        echo "CPU skipped"
	break
fi
########################################
if [ "$name3" = "Y" ];
then
        echo "*****RAM*****"
        free -m
        echo ""
else
	echo "RAM skipped"
        break
fi
########################################
if [ "$name4" = "Y" ];
then
        echo "*****NETWORK*****"
        ifconfig | head -2
	echo ""
else
	echo "Network skipped"
        break
fi
########################################
if [ "$name5" = "Y" ];
then
        echo "*****VOLUMES*****"
        echo "There is $volume_count volume(s) ($volume_name) on this machine with $volume_size total space and $volume_free available space"
	echo ""
        echo "*****CPU*****"
        lscpu | egrep "^CPU\(s):Model name|Core|MHz"
	echo ""
        echo "*****RAM*****"
        free -m
	echo ""
        echo "*****NETWORK*****"
        ifconfig | head -2
else
        echo "ALL skipped"
	break
fi

