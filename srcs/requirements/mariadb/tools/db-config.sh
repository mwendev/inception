#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:root /run/mysqld
fi

if [ -d "/var/lib/mysql" ]; then
	
	chown -R mysql:root /var/lib/mysql

	#init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	echo "2"

	# https://stackoverflow.com/questions/10299148/mysql-error-1045-28000-access-denied-for-user-billlocalhost-using-passw

	# run init.sql
	/usr/bin/mysqld --user=mysql --bootstrap < /tmp/init_db.sql
	rm -f /tmp/init_db.sql
fi

# allow remote connections
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec ps
