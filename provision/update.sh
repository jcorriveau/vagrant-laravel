#!/usr/bin/env bash

echo "********************************************************************************"
echo "                             UPDATING PACKAGE LIST                              "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw epel-release; then
	sudo rpm --import https://fedoraproject.org/static/0608B895.txt
	sudo yum install http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm -y --quiet
fi

if ! rpm -qa | grep -qw remi-release; then
	sudo rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi --quiet
	sudo yum install http://rpms.famillecollet.com/enterprise/remi-release-6.rpm -y --quiet
fi

sudo yum check-update --quiet
sudo yum update -y --quiet

echo "Updating package list done successfully!"
printf "\n"