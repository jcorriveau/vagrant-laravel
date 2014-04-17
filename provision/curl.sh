#!/usr/bin/env bash

echo "********************************************************************************"
echo "                             INSTALLING CURL                                    "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw curl; then
	sudo yum install curl -y --quiet
	
	echo "Curl installed successfully!"
	printf "\n"
	exit 0
else
	echo "Curl already installed!"
	printf "\n"
	exit 1
fi