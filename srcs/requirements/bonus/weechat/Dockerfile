FROM	debian:buster

RUN		apt-get update && apt-get install -y g++ make

COPY	conf/irc-config.sh /tmp/irc-config.sh
COPY	conf/irc/* /tmp/irc/

ENTRYPOINT [ "sh", "/tmp/irc-config.sh" ]