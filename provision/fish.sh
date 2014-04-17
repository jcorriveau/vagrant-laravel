#!/usr/bin/env bash

echo "********************************************************************************"
echo "                              INSTALLING FISHSHELL                              "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw fish; then
    sudo yum install fish -y --quiet

    sudo chsh -s /usr/bin/fish vagrant > /dev/null 2>&1 &

    mkdir -p /home/vagrant/.config/fish/

cat << EOF >> /home/vagrant/.config/fish/config.fish
set fish_greeting ""
EOF

	echo "Fish Shell installed successfully!"
	printf "\n"
	exit 0
else
	echo "Fish Shell already installed!"
	printf "\n"
	exit 1
fi