FROM	debian:buster
EXPOSE	9000
#install PHP-FPM and some common modules to run a PHP application like WordPress
RUN		apt-get update && apt-get install -y php-fpm 
#config PHP-FPM
COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
#install wp-cli command tool
RUN	mkdir -p /var/www/html \
WORKDIR	/var/www
RUN	apt-get install -y wget && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp;
#download wordpress and config WordPress
RUN	wp core download --allow-root

#install wordpress, create config file and set user
RUN wp config create --allow-root --dbname=$MARIADB_DB_NAME --dbuser=$MARIADB_USER_NAME --dbpass=$MARIADB_USER_PWD --dbhost='localhost' --dbcharset="utf8" --dbcollate="utf8_general_ci"
RUN	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
RUN	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}

CMD ["/usr/sbin/php-fpm", "--nodaemonize"]