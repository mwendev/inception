FROM	debian:buster
#install PHP-FPM and some common modules to run a PHP application like WordPress
RUN		apt-get update && apt-get install -y php7.4 php-fpm 
#config PHP-FPM
COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
#install WordPress and make command wp available
RUN	mkdir -p /var/www/html && \ apt-get install -y wget
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp;
#config WordPress
RUN	cd /var/www/html && wp core download --allow-root && mv ./conf/wp-config.php ./

#set user
RUN	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
RUN	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}

EXPOSE	9000

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]