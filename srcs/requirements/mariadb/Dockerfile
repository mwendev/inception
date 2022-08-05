FROM	debian:buster

RUN		apt-get update && apt-get install -y mariadb-server

EXPOSE	3306

COPY	./conf/my.cnf /etc/mysql/
COPY	./tools/init_db.sql /tmp/

CMD		["mysqld", "--init-file=/tmp/init_db.sql"]
