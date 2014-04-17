sudo yum install php-xdebug -y --quiet

cat << EOF >> /etc/php.d/xdebug.ini
xdebug.scream=1
xdebug.cli_color=1
xdebug.show_local_vars=1
EOF

echo "PHP Xdebug installed successfully!"
printf "\n"