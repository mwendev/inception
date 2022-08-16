FROM	debian:buster

RUN		apt-get update && apt-get install -y c++ make

COPY	conf/irc-config.sh /tmp/irc-config.sh
COPY	conf/ft_irc/* /tmp/ft_irc/

ENTRYPOINT [ "sh", "/tmp/irc-config.sh" ]