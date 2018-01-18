#!/usr/bin/env bash

CPU_COUNT=`grep processor /proc/cpuinfo | wc -l`;

tmp_=`basename "$(cat /proc/1/cpuset)"`
CONTAINER_ID=${tmp_:0:12}

tmp_=$(date --rfc-3339=seconds);
tmp_=${tmp_:0:19};
TIMESTAMP=$(echo "$tmp_" | sed 's/[ \:\-]//g');


if [ "$1" = "php-fpm" ]; then
    echo "CPU_COUNT = $CPU_COUNT";
    echo "CONTAINER_ID = $CONTAINER_ID";
    echo "TIMESTAMP = $TIMESTAMP";
    echo "";

    sed -i "s/env\[CPU_COUNT] =.*/env[CPU_COUNT] = $CPU_COUNT;/" /etc/php/7.2/fpm/pool.d/www.conf
    sed -i "s/env\[CONTAINER_ID] =.*/env[CONTAINER_ID] = $CONTAINER_ID;/" /etc/php/7.2/fpm/pool.d/www.conf
    sed -i "s/env\[TIMESTAMP] =.*/env[TIMESTAMP] = $TIMESTAMP;/" /etc/php/7.2/fpm/pool.d/www.conf
    sed -i "s/pm.max_children = .*/pm.max_children = $CPU_COUNT/" /etc/php/7.2/fpm/pool.d/www.conf

    mkdir -p /var/run/php
    exec php-fpm7.2
fi

exec "$@"
