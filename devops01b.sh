#!/bin/sh

volume_name=`df -h | grep "^/" | awk '{print $1}'`
volume_count=`df -h | grep "^/" | wc | awk '{print $1}'`
volume_size=`df -h | grep "^/" | awk '{print $2}'`
volume_free=`df -h | grep "^/" | awk '{print $4}'`

echo "Please enter a paramater to check on this machine (volumes | cpu | ram | network | all)"
while :
do
	read input_string
	case $input_string in 
		volumes)
			echo "------------------------------------------------------------------------------------"
			#echo "Volumes"
			echo "There is $volume_count volume(s) ($volume_name) on this machine with $volume_size total space and $volume_free available space"
			break
			;;
		cpu)
			echo "------------------------------------------------------------------------------------"
			#echo "Cpu"
			lscpu | egrep "^CPU\(s):|Model name|Core|MHz"
			break
			;;
		ram)
			echo "------------------------------------------------------------------------------------"
                        #echo "Ram"
			free -m
			break
			;;
		network)
			echo "------------------------------------------------------------------------------------"
                        #echo "Network"
			ifconfig | head -2
			break
			;;
		all)
			echo "------------------------------------------------------------------------------------"
                        #echo "All"
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

			break
			;;
		*)
			echo "Please provide correct parmater out of (volumes | cpu | ram | network | all) options"
			break
			;;
	esac
done


a
