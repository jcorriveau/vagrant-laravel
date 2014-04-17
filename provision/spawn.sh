#!/usr/bin/env bash

echo "********************************************************************************"
echo "                             INSTALLING SPAWN                                   "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw spawn; then
	sudo yum install spawn -y --quiet
	
	echo "Spawn installed successfully!"
	printf "\n"
	exit 0
else
	echo "Spawn already installed!"
	printf "\n"
	exit 1
fi