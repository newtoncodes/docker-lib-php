#!/usr/bin/env bash

dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
v="$1"

if [ "$v" = "" ] || [ "$v" = "5.6" ]; then
    cd ${dir}/../5.6 && docker build -t newtoncodes/php .
    cd ${dir}/../5.6 && docker build -t newtoncodes/php:5.6 .
else
    cd ${dir}/../${v} && docker build -t newtoncodes/php:${v} .
fi
