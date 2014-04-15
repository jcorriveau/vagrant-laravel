#!/usr/bin/env bash

echo "********************************************************************************"
echo "                              INSTALLING COMPOSER                               "
echo "********************************************************************************"
printf "\n"

if [ ! -f /usr/local/bin/composer ];
then
	curl -sS https://getcomposer.org/installer | php > /dev/null 2>&1 &
	sudo mv composer.phar /usr/local/bin/composer > /dev/null 2>&1 &

	echo "Composer installed successfully!"
	printf "\n"
else
	echo "Composer already installed!"
	printf "\n"
fi