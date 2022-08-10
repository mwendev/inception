#!/bin/sh

#wait for mysql
while ! mariadb -h'localhost:3306' -u$MARIADB_USER_NAME -p$MARIADB_USER_PWD $MARIADB_DB_NAME &>/dev/null; do
	sleep 3
done

if [ ! -f "/var/www/html/index.html" ]; then

	# rm -f /var/www/html/index.html
	# mv /tmp/greppo/* /var/www/html

	wp config create --allow-root --dbname=$MARIADB_DB_NAME --dbuser=$MARIADB_USER_NAME --dbpass=$MARIADB_USER_PWD --dbhost='localhost:3306' --dbcharset="utf8" --dbcollate="utf8_general_ci" 
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --role=author
    wp theme install inspiro --activate --allow-root
fi

/usr/sbin/php-fpm -F -R
