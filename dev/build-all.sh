#!/usr/bin/env bash

dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

set -e

cd ${dir}/../5.6 && docker build -t newtoncodes/php .
cd ${dir}/../5.6 && docker build -t newtoncodes/php:5.6 .
cd ${dir}/../5.6-fpm && docker build -t newtoncodes/php:5.6-fpm .
cd ${dir}/../5.6-nginx && docker build -t newtoncodes/php:5.6-nginx .
cd ${dir}/../7.1 && docker build -t newtoncodes/php:7.1 .
cd ${dir}/../7.1-fpm && docker build -t newtoncodes/php:7.1-fpm .
cd ${dir}/../7.1-nginx && docker build -t newtoncodes/php:7.1-nginx .
#cd ${dir}/../7.2 && docker build -t newtoncodes/php:7.2 .
#cd ${dir}/../7.2-fpm && docker build -t newtoncodes/php:7.2-fpm .
#cd ${dir}/../7.2-nginx && docker build -t newtoncodes/php:7.2-nginx .
