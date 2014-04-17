#!/usr/bin/env bash

echo "********************************************************************************"
echo "                               INSTALLING HTTPD                                 "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw httpd; then
	sudo yum install httpd -y --quiet

	#sudo sed -ri -e 's/^#ServerName\swww.example.com:80/ServerName\ localhost/' /etc/httpd/conf/httpd.conf

	sudo rm -rf /etc/httpd/conf.d/welcome.conf
	sudo touch /etc/httpd/conf.d/welcome.conf

	#if [ $1 == "laravel" ]; then
	#	sudo rm -rf /var/www/html

	#	if [ ! -d "/vagrant/public" ]; then
  	#		mkdir -p /vagrant/public
	#	fi

	#	sudo ln -fs /vagrant/public /var/www/html
	#fi

	sudo chown -R vagrant:vagrant /var/www

    sudo systemctl enable httpd.service > /dev/null 2>&1 &

    sudo sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config

    sudo firewall-cmd --permanent --zone=public --add-port=80/tcp > /dev/null 2>&1 &
    sudo firewall-cmd --permanent --zone=public --add-service=http > /dev/null 2>&1 &

	sudo sed -i 's,#\(LoadModule rewrite_module modules/mod_rewrite.so\),\1,g' /etc/httpd/conf/httpd.conf
    sudo sed -i 's/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
    sudo sed -i 's#User apache#User vagrant#' /etc/httpd/conf/httpd.conf
	sudo sed -i 's#Group apache#Group vagrant#' /etc/httpd/conf/httpd.conf
	sudo sed -i 's#DocumentRoot "/var/www/html"#DocumentRoot "/var/www/public"#' /etc/httpd/conf/httpd.conf
	sudo sed -i 's#<Directory "/var/www/html">#<Directory "/var/www/public">#' /etc/httpd/conf/httpd.conf

	echo "HTTPD installed successfully!"
	printf "\n"
else
	echo "HTTPD already installed!"
	printf "\n"
fi