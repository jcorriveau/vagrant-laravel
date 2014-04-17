#!/usr/bin/env bash

if ! rpm -qa | grep -qw curl; then
	sudo yum install curl -y --quiet
	
	if [[ $? == 0 ]]; then
		echo -e "\e[97mInstalling curl ...\t\t [\e[92mOK\e[97m]"
	else
		echo -e "\e[97mInstalling curl ...\t\t [\e[91mFAILED\e[97m]"
	fi
else
	echo -e "\e[97mInstalling curl ...\t\t [\e[92mOK\e[97m]"
fi