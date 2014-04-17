#!/usr/bin/env bash

if ! rpm -qa | grep -qw fish; then
    sudo yum install fish -y --quiet

    $step1 = $?

    sudo chsh -s /usr/bin/fish vagrant > /dev/null 2>&1 &

    $step2 = $?

    mkdir -p /home/vagrant/.config/fish/

    $step3 = $?

cat << EOF >> /home/vagrant/.config/fish/config.fish
set fish_greeting ""
EOF

	$step4 = $?

	if [[ $step1 == 0 && $step2 == 0 && $step3 == 0 && $step4 == 0 ]]; then
		echo -e "\e[97mInstalling fish ...\t\t [\e[92mOK\e[97m]"
	else
		echo -e "\e[97mInstalling fish ...\t\t [\e[91mFAILED\e[97m]"
	fi
else
	echo -e "\e[97mInstalling fish ...\t\t [\e[92mOK\e[97m]"
fi