FROM	debian:buster

RUN		apt-get update && apt-get install -y mariadb mariadb-client

EXPOSE	3306

COPY	./conf/my.cnf /etc/mysql/
COPY	./tools/init_db.sql /tmp/

CMD		["mysqld", "--user=mysql", "--init-file=/tmp/init_db.sql"]
