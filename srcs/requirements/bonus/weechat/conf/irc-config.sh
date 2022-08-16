#!/bin/sh

cp /tmp/ft_irc/ ~/ft_irc
cd ~/ft_irc/
make

exec ./ircserv 6667 nope