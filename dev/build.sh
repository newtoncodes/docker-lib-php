#!/usr/bin/env bash

dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
v="$1"

set -e

if [ "$v" = "" ] || [ "$v" = "5.6" ]; then
    cd ${dir}/../5.6 && docker build -t newtoncodes/php .
    cd ${dir}/../5.6 && docker build -t newtoncodes/php:5.6 .
    cd ${dir}/../5.6-fpm && docker build -t newtoncodes/php:5.6-fpm .
    cd ${dir}/../5.6-nginx && docker build -t newtoncodes/php:5.6-nginx .
else
    cd ${dir}/../${v} && docker build -t newtoncodes/php:${v} .
    cd ${dir}/../${v}-fpm && docker build -t newtoncodes/php:${v}-fpm .
    cd ${dir}/../${v}-nginx && docker build -t newtoncodes/php:${v}-nginx .
fi
