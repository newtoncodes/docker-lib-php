#!/usr/bin/env bash

CPU_COUNT=`grep processor /proc/cpuinfo | wc -l`;

tmp_=`basename "$(cat /proc/1/cpuset)"`
CONTAINER_ID=${tmp_:0:12}

tmp_=$(date --rfc-3339=seconds);
tmp_=${tmp_:0:19};
TIMESTAMP=$(echo "$tmp_" | sed 's/[ \:\-]//g');


if [ "$1" = "nginx" ]; then
    echo "CPU_COUNT = $CPU_COUNT";
    echo "CONTAINER_ID = $CONTAINER_ID";
    echo "TIMESTAMP = $TIMESTAMP";
    echo "";

    if [ "$THREADS" = "auto" ]; then
        sed -i "s/worker_processes .*/worker_processes $CPU_COUNT;/" /etc/nginx/nginx.conf
    else
        sed -i "s/worker_processes .*/worker_processes $THREADS;/" /etc/nginx/nginx.conf
    fi

    sed -i "s#access_log /var/log/nginx/access.log#access_log /var/log/nginx/access.$TIMESTAMP-$CONTAINER_ID.log#" /etc/nginx/nginx.conf
    sed -i "s#error_log /var/log/nginx/error.log#error_log /var/log/nginx/error.$TIMESTAMP-$CONTAINER_ID.log#" /etc/nginx/nginx.conf

    if [ -f /etc/nginx/vhosts/default.conf ]; then
        sed -i "s#access_log /var/log/nginx/access.log#access_log /var/log/nginx/access.$TIMESTAMP-$CONTAINER_ID.log#" /etc/nginx/vhosts/default.conf
        sed -i "s#error_log /var/log/nginx/error.log#error_log /var/log/nginx/error.$TIMESTAMP-$CONTAINER_ID.log#" /etc/nginx/vhosts/default.conf
    fi

    exec nginx
    exit 0
fi

if [ "$1" = "php-fpm" ]; then
    echo "CPU_COUNT = $CPU_COUNT";
    echo "CONTAINER_ID = $CONTAINER_ID";
    echo "TIMESTAMP = $TIMESTAMP";
    echo "";

    sed -i "s^catch_workers_output = yes^;catch_workers_output = yes^" /etc/php/5.6/fpm/pool.d/www.conf
    sed -i "s^error_log = /proc/self/fd/2^;error_log = /proc/self/fd/2^" /etc/php/5.6/fpm/pool.d/www.conf
    sed -i "s^access.log = /proc/self/fd/2^;access.log = /proc/self/fd/2^" /etc/php/5.6/fpm/pool.d/www.conf
    sed -i "s^listen = 0\.0\.0\.0\:9000.*^listen = /run/php/php-fpm.sock^" /etc/php/5.6/fpm/pool.d/www.conf
    sed -i "s/env\[CPU_COUNT] =.*/env[CPU_COUNT] = $CPU_COUNT;/" /etc/php/5.6/fpm/pool.d/www.conf
    sed -i "s/env\[CONTAINER_ID] =.*/env[CONTAINER_ID] = $CONTAINER_ID;/" /etc/php/5.6/fpm/pool.d/www.conf
    sed -i "s/env\[TIMESTAMP] =.*/env[TIMESTAMP] = $TIMESTAMP;/" /etc/php/5.6/fpm/pool.d/www.conf

    if [ "$THREADS" = "auto" ]; then
        sed -i "s/pm.max_children = .*/pm.max_children = $CPU_COUNT/" /etc/php/5.6/fpm/pool.d/www.conf
    else
        sed -i "s/pm.max_children = .*/pm.max_children = $THREADS/" /etc/php/5.6/fpm/pool.d/www.conf
    fi

    mkdir -p /var/run/php
    exec php-fpm5.6
    exit 0
fi

if [ "$1" = "supervisord" ]; then
    echo "CPU_COUNT = $CPU_COUNT";
    echo "CONTAINER_ID = $CONTAINER_ID";
    echo "TIMESTAMP = $TIMESTAMP";
    echo "";

    exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
    exit
fi

exec "$@"