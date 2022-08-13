#!/bin/sh

if [ ! -f "/etc/redis.conf.bak" ]; then

    cp /etc/redis.conf /etc/redis.conf.bak

	echo "hi"
    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis.conf
    sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis.conf
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis.conf
fi

sysctl vm.overcommit_memory=1

redis-server --protected-mode no