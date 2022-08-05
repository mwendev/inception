FROM	debian:buster

RUN		apt-get update && apt-get install -y mariadb-server

EXPOSE	3306

COPY ./conf/my.cnf /etc/mysql/
COPY ./tools/init_db.sql /tmp/

RUN mysqld --user=mysql --init-file=/tmp/init_db.sql;

CMD ["mysqld"]
