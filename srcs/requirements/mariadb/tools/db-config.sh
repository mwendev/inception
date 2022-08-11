#!/bin/sh

# if [ ! -d "/run/mysqld" ]; then
# 	mkdir -p /run/mysqld
# 	chown -R mysql:mysql /run/mysqld
# fi

if [ -d "/var/lib/mysql" ]; then
	
	chown -R mysql:mysql /var/lib/mysql

	#init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	# run init.sql
	# /usr/bin/mysqld --user=mysql --bootstrap < /tmp/init_db.sql
	# rm -f /tmp/init_db.sql

# 	mysql -u root <<MYSQL_SCRIPT
# FLUSH PRIVILEGES;
# CREATE DATABASE IF NOT EXISTS $MARIADB_DB_NAME;
# CREATE USER IF NOT EXISTS '$MARIADB_USER_NAME'@'%' IDENTIFIED BY '$MARIADB_USER_PWD';
# GRANT ALL PRIVILEGES ON $MARIADB_DB_NAME.* TO '$MARIADB_USER_NAME'@'%';
# FLUSH PRIVILEGES;
# MYSQL_SCRIPT
# 	echo "hi"
fi

# allow remote connections
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

# exec /usr/bin/mysqld --user=mysql
exec /usr/bin/mysqld --user=mysql --init-file=/tmp/init_db.sql

