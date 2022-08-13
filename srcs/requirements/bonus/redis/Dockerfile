FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
	redis

COPY conf/rd-config.sh /tmp/rd-config.sh
ENTRYPOINT ["sh", "/tmp/rd-config.sh"]