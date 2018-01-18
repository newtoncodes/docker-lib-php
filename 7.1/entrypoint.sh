#!/usr/bin/env bash

export CPU_COUNT=`grep processor /proc/cpuinfo | wc -l`;

tmp_=`basename "$(cat /proc/1/cpuset)"`
export CONTAINER_ID=${tmp_:0:12}

tmp_=$(date --rfc-3339=seconds);
tmp_=${tmp_:0:19};
export TIMESTAMP=$(echo "$tmp_" | sed 's/[ \:\-]//g');


if [ "$1" = "php" ]; then
    exec php7.1
fi

exec "$@"
