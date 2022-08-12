FROM	alpine:3.13

RUN		apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client

COPY conf/db-config.sh /tmp/db-config.sh
COPY tools/init_db.sql /tmp/init_db.sql

ENTRYPOINT ["sh", "/tmp/db-config.sh"]
