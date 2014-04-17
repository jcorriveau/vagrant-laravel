#!/usr/bin/env bash

if ! rpm -qa | grep -qw spawn; then
	sudo yum install spawn -y --quiet
	
	if [[ $? == 0 ]]; then
		echo -e "\e[97mInstalling spawn ...\t\t [\e[92mOK\e[97m]"
	else
		echo -e "\e[97mInstalling spawn ...\t\t [\e[91mFAILED\e[97m]"
	fi
else
	echo -e "\e[97mInstalling spawn ...\t\t [\e[92mOK\e[97m]"
fi