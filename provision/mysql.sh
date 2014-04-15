#!/usr/bin/env bash

echo "********************************************************************************"
echo "                                INSTALLING MYSQL                                "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw mysql-server; then
    sudo yum install mysql-server mysql -y --quiet
    sudo service mysqld start > /dev/null 2>&1 &
	sudo chkconfig mysqld on > /dev/null 2>&1 &

	echo "MySQL installed successfully!"
	printf "\n"
	exit 0
else
	echo "MySQL already installed!"
	printf "\n"
	exit 1
fi