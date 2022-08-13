FROM	alpine:3.13

COPY	conf/greppo /tmp/greppo
COPY	conf/wb-config.php /tmp/

ENTRYPOINT [ "sh", "/tmp/wb-config.sh" ]
