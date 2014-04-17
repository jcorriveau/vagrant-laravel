#!/usr/bin/env bash

echo "********************************************************************************"
echo "                             INSTALLING EXPECT                                  "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw expect; then
	sudo yum install expect -y --quiet
	
	echo "Expect installed successfully!"
	printf "\n"
	exit 0
else
	echo "Expect already installed!"
	printf "\n"
	exit 1
fi