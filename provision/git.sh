#!/usr/bin/env bash

echo "********************************************************************************"
echo "                                INSTALLING GIT                                  "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw git; then
    sudo yum install git -y --quiet

	echo "Git installed successfully!"
	printf "\n"
	exit 0
else
	echo "Git already installed!"
	printf "\n"
	exit 1
fi