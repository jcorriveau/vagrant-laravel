#!/usr/bin/env bash

echo "********************************************************************************"
echo "                                 INSTALLING PHP                                 "
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

if ! rpm -qa | grep -qw php; then
	sudo yum --enablerepo=remi,remi-php55 install php php-common -y --quiet

	sudo sh /vagrant/provision/php_xdebug.sh
	
	if [ $1 == "laravel" ]; then
		sudo yum --enablerepo=remi,remi-php55 install php-pdo -y --quiet
		sudo yum --enablerepo=remi,remi-php55 install php-mcrypt -y --quiet
	fi

	sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php.ini
	sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php.ini

	sudo service httpd restart > /dev/null 2>&1 &
	echo "PHP installed successfully!"
	printf "\n"
else
	echo "PHP already installed!"
	printf "\n"
fi