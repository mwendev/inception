FROM	alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
	wget
RUN	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /tmp/adminer.php
RUN	wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /tmp/adminer.css

COPY	conf/ad-config.sh /tmp/

CMD	["bash", "/tmp/ad-config.sh"]
