#!/bin/sh

cp /tmp/irc/ ~/irc
cd ~/irc/
make

exec ./ircserv 6667 nope