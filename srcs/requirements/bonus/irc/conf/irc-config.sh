#!/bin/sh

mkdir -p ~/ft_irc
cp /tmp/ft_irc/* ~/ft_irc
cd ~/ft_irc/
make

exec ./ircserv 6667 nope