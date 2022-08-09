#!/bin/sh

#wait for mysql
while ! mariadb -h'localhost' -u$MARIADB_USER_NAME -p$MARIADB_USER_PWD $MARIADB_DB_NAME &>/dev/null; do
    sleep 3
done

if [ ! -f "/var/www/html/index.html" ]; then

    mv /tmp/greppo/* /var/www/html/index.html

	wp config create --allow-root --dbname=$MARIADB_DB_NAME --dbuser=$MARIADB_USER_NAME --dbpass=$MARIADB_USER_PWD --dbhost='localhost' --dbcharset="utf8" --dbcollate="utf8_general_ci" --config-file=/var/www/html/wp-config.php
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --path=/var/www/html
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}
fi

/usr/sbin/php-fpm -F -R
