#!/usr/bin/env bash

echo "********************************************************************************"
echo "                              INSTALLING FISHSHELL                              "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw fish; then
    sudo yum install http://fishshell.com/files/2.1.0/linux/RedHat_RHEL-5/fish-2.1.0-2.1.i386.rpm -y --quiet

    sudo chsh -s /usr/bin/fish vagrant

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