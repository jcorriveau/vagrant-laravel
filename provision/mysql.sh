#!/usr/bin/env bash

echo "********************************************************************************"
echo "                                INSTALLING MARIADB                                "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw mariadb-server; then
    sudo yum install mariadb-server mariadb -y --quiet
    sudo systemctl start mariadb.service > /dev/null 2>&1 &
    sudo systemctl enable mariadb.service > /dev/null 2>&1 &

	echo "MariaDB installed successfully!"
	printf "\n"
	exit 0
else
	echo "MariaDB already installed!"
	printf "\n"
	exit 1
fi