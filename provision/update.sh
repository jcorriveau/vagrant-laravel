#!/usr/bin/env bash

sudo yum check-update --quiet
sudo yum update -y --quiet

if [[ $? == 0 ]]; then
	echo -e "\e[97mChecking for updates ...\t [\e[92mOK\e[97m]"
else
	echo -e "\e[97mChecking for updates ...\t [\e[91mFAILED\e[97m]"
fi