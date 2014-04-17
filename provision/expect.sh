#!/usr/bin/env bash

if ! rpm -qa | grep -qw expect; then
	sudo yum install expect -y --quiet
	
	if [[ $? == 0 ]]; then
		echo -e "\e[97mInstalling expect ...\t\t [\e[92mOK\e[97m]"
	else
		echo -e "\e[97mInstalling expect ...\t\t [\e[91mFAILED\e[97m]"
	fi
else
	echo -e "\e[97mInstalling expect ...\t\t [\e[92mOK\e[97m]"
fi