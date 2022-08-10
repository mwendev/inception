FROM	debian:buster

RUN		apt-get update && apt-get install -y mariadb-server

EXPOSE	3306

COPY	./conf/my.cnf /etc/mysql/
COPY	./tools/init_db.sql /tmp/init_db.sql

RUN		mariadb -password=$MARIADB_ROOT_PWD < /tmp/init_db.sql