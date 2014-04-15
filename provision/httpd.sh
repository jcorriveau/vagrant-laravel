#!/usr/bin/env bash

echo "********************************************************************************"
echo "                               INSTALLING APACHE2                               "
echo "********************************************************************************"
printf "\n"

if ! rpm -qa | grep -qw httpd; then
#	sudo yum --enablerepo=remi,remi-php55 install httpd -y --quiet
	sudo yum install httpd -y --quiet
	sudo sed -ri -e 's/^#ServerName\swww.example.com:80/ServerName\ localhost/' /etc/httpd/conf/httpd.conf
	sudo sed -i 's,#\(LoadModule rewrite_module modules/mod_rewrite.so\),\1,g' /etc/httpd/conf/httpd.conf
	sudo sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config
	sudo sed -i 's/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
	sudo sed -i 's#User apache#User vagrant#' /etc/httpd/conf/httpd.conf
	sudo sed -i 's#Group apache#User vagrant#' /etc/httpd/conf/httpd.conf

	sudo rm -rf /etc/httpd/conf.d/welcome.conf
	sudo touch /etc/httpd/conf.d/welcome.conf

	sudo setenforce 0

	sudo service iptables save > /dev/null 2>&1 &
    sudo service iptables stop > /dev/null 2>&1 &

    sudo chkconfig iptables off > /dev/null 2>&1 &

	if [ $1 == "laravel" ]; then
		sudo rm -rf /var/www/html

		if [ ! -d "/vagrant/public" ]; then
  			mkdir -p /vagrant/public
		fi

		sudo ln -fs /vagrant/public /var/www/html
	fi

	sudo chown -R vagrant:vagrant /var/www

	sudo chkconfig --add httpd

    sudo chkconfig --levels 2345 httpd on

    sudo service httpd start > /dev/null 2>&1 &

    #sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT

	echo "Apache2 installed successfully!"
	printf "\n"
else
	echo "Apache2 already installed!"
	printf "\n"
fi