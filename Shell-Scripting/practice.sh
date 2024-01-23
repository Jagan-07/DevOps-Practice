#!/bin/bash


#####################
# Author: Jagan T
# Date: 23/01/2024
# Version: v1
# This script outputs the node health which is done by DevOps Engineers
#####################

set -x # Debug mode
set -e # Exits the script when there is a ERROR
set -o pipefail

# outputs the disk space
df -h

# outputs memory(RAM)
free -g

# outputs all in one
top

# outputs the CPU
nproc

# ps -ef gives the detile info about processes, gerp filters the ooutput with only keyword 'pipewire', awk prints the 2nd column which is PID
ps -ef | grep pipewire | awk -F" " '{print $2}'

# outputs only 'Today is', pipe symbole not works because the date is system default command which sends the output to STDIN channel.
date | echo "Today is "

# outputs the logfile without downloading to local machine
#curl https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/apache_logs/apache_logs | grep error

# downloads the logfile to local machine
#wget https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/apache_logs/apache_logs

# finds the given name, /(This mean entire file system)
sudo find / -name pam

# ifelse conditions 
a=4
b=7

if [ $a > $b ]
then
	echo "A is greater than B"
else
	echo "B is greater than A"
fi

# Also learn For loop

# Also trap command which is used to trap the linux signals





