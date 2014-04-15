#!/usr/bin/env bash

echo "********************************************************************************"
echo "                               INSTALLING APACHE2                               "
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

if ! rpm -qa | grep -qw httpd; then
	sudo yum --enablerepo=remi,remi-php55 install httpd -y --quiet
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

    sudo service httpd start > /dev/null 2>&1 &

    sudo chkconfig --add httpd
    sudo chkconfig httpd on

    #sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT

	echo "Apache2 installed successfully!"
	printf "\n"
else
	echo "Apache2 already installed!"
	printf "\n"
fi