FROM	debian:buster
EXPOSE	9000
#install PHP-FPM and some common modules to run a PHP application like WordPress
RUN		apt-get update && apt-get install -y php-fpm
#config PHP-FPM
COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

#install wp-cli command tool to download wordpress
RUN	apt-get install -y wget && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp;

#static web
COPY conf/greppo /tmp/

WORKDIR	/var/www/html
#download
RUN	wp core download --allow-root
#install wordpress, create config file and set user
COPY tools/wp-config.sh /tmp/wp-config.sh
ENTRYPOINT [ "sh", "/tmp/configure.sh" ]
