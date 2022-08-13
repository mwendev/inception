#!/bin/sh

if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then

	cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
	mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

	# Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
	adduser ftpmwen --disabled-password
	echo "ftpmwen:Imftpuser123" | /usr/sbin/chpasswd &> /dev/null
	chown -R ftpmwen:ftpmwen /var/www/html

    echo ftpmwen | tee -a /etc/vsftpd.userlist &> /dev/null

fi

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf