#!/usr/bin/env bash

echo "********************************************************************************"
echo "                                 INSTALLING PHP                                 "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw php; then
	sudo yum install php php-common -y --quiet

	sudo sh /vagrant/provision/php_xdebug.sh
	
	if [ $1 == "laravel" ]; then
		sudo yum install php-pdo -y --quiet
		sudo yum install php-mcrypt -y --quiet
	fi

	sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php.ini
	sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php.ini

	echo "PHP installed successfully!"
	printf "\n"
else
	echo "PHP already installed!"
	printf "\n"
fi