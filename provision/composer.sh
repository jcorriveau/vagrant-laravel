#!/usr/bin/env bash

echo "********************************************************************************"
echo "                              INSTALLING COMPOSER                               "
echo "********************************************************************************"
printf "\n"

if [ ! -f /usr/local/bin/composer ];
then
	cd /home/vagrant/
	curl -sS https://getcomposer.org/installer | php 
	sudo mv composer.phar /usr/local/bin/composer

	echo "Composer installed successfully!"
	printf "\n"
else
	echo "Composer already installed!"
	printf "\n"
fi