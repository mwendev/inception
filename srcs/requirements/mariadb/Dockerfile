# FROM	alpine:3.13

# RUN		apk update && apk upgrade && apk add --no-cache \
#         mariadb \
#         mariadb-client
# EXPOSE 3306
# COPY tools/db-config.sh /tmp/db-config.sh

# ENTRYPOINT ["sh", "/tmp/db-config.sh"]

#check if expose 3306
#remove my.conf

FROM	debian:buster
RUN	apt-get update && apt-get install -y vim mariadb-server mariadb-client
COPY	./conf/my.cnf /etc/mysql/my.cnf
COPY	./tools/db-config.sh /tmp/db-config.sh
COPY	./tools/init_db.sql /tmp/init_db.sql

CMD	["bash", "/tmp/db-config.sh"]