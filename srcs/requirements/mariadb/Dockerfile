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
COPY	./config/my.cnf /etc/mysql/my.cnf
COPY	./config/startup.sh /tmp/startup.sh
COPY	./config/dbinit.sql /tmp/dbinit.sql

CMD	["bash", "/tmp/startup.sh"]