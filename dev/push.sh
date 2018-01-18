#!/usr/bin/env bash

v="$1"

set -e

if [ "$v" = "" ] || [ "$v" = "5.6" ]; then
    docker push newtoncodes/php
    docker push newtoncodes/php:5.6
    docker push newtoncodes/php:5.6-fpm
    docker push newtoncodes/php:5.6-nginx
else
    docker push newtoncodes/php:${v}
    docker push newtoncodes/php:${v}-fpm
    docker push newtoncodes/php:${v}-nginx
fi
