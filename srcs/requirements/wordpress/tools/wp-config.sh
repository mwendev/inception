#!/bin/sh

#test mysql
while ! mariadb -h'mariadb' -u'mwen' -p'mwen42' wordpress &>/dev/null; do
	sleep 3
done

if [ -f "/var/www/html/index.html" ]; then

	mv /tmp/index.html /var/www/html/index.html
	echo "huh"


    # adminer
    wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/adminer.php &> /dev/null
    wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /var/www/html/adminer.css &> /dev/null

    wp core download --allow-root
	echo "yo"
    wp config create --dbname=wordpress --dbuser=mwen --dbpass=mwen42 --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	echo "who wants php"
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --role=author
 	echo "is it you"
    wp theme install inspiro --activate --allow-root
	echo "yoyoyo"
fi

echo "yo?"
/usr/sbin/php-fpm7 -F -R
