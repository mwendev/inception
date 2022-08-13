FROM	alpine:3.13

RUN		apk update && apk upgrade && apk add --no-cache \
		vsftpd

COPY	conf/vsftpd.conf /tmp/vsftpd.conf

COPY	conf/ftp-config.sh /tmp/ftp-config.sh
ENTRYPOINT ["sh", "/tmp/ftp-config.sh"]