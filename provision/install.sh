#!/usr/bin/env bash

echo "================================================================================"
echo "                             INSTALLING SOFTWARES                               "
echo "                        Development environnement for $1                        "
echo "================================================================================"
printf "\n"
echo "START ..."
printf "\n"

sh /vagrant/provision/update.sh
sh /vagrant/provision/curl.sh
sh /vagrant/provision/expect.sh
sh /vagrant/provision/spawn.sh
sh /vagrant/provision/git.sh
sh /vagrant/provision/fish.sh
sh /vagrant/provision/httpd.sh $1
sh /vagrant/provision/mysql.sh

if [[ $? == 0 ]]; then
	expect /vagrant/provision/mysql_configurations.exp
fi

sh /vagrant/provision/php.sh $1
sh /vagrant/provision/composer.sh

printf "\n"
echo "ALL DONE!"
echo "VAGRANT IS NOW RELOADING THE VM ..."
printf "\n"