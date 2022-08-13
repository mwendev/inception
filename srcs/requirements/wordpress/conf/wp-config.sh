#!/bin/sh

#connect to mysql
while ! mariadb -h'mariadb' -u'mwen' -p'mwen42' wordpress &>/dev/null; do
	sleep 3
done

if [ ! -f "/var/www/html/index.html" ]; then

	mv /tmp/greppo/* /var/www/html

	# adminer
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/adminer.php &> /dev/null
	wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /var/www/html/adminer.css &> /dev/null

	wp core download --allow-root --force
	wp config create --dbname=wordpress --dbuser=mwen --dbpass=mwen42 --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --allow-root --url=localhost --title=inception --admin_user=wpmwen --admin_password="Iamadmin123" --admin_email=wpmwen@gmail.com --skip-email
	wp user create --allow-root mwen mwen@gmail.com --user_pass="Imuser123" --role=author
	#in case wordpress assigns random password cuz password was too weak
	# wp user update --allow-root wpmwen --user_pass=Iamadmin123;
	# wp user update --allow-root mwen --user_pass=Imuser123;

	# enable redis cache
	sed -i "40i define( 'WP_REDIS_HOST', 'redis' );"			wp-config.php
	sed -i "41i define( 'WP_REDIS_PORT', 6379 );"				wp-config.php
	sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"				wp-config.php
	sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"			wp-config.php
	sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"			wp-config.php

    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
fi

chown nginx:nginx /var/www/html

wp redis enable --allow-root

/usr/sbin/php-fpm7 -F -R
