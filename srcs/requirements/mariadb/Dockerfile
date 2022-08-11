FROM	alpine:3.13

RUN		apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client
EXPOSE 3306

COPY tools/db-config.sh /tmp/db-config.sh

ENTRYPOINT ["sh", "/tmp/db-config.sh"]

#check if expose 3306
#remove my.conf
