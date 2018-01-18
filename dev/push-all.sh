#!/usr/bin/env bash

set -e

docker push newtoncodes/php
docker push newtoncodes/php:5.6
docker push newtoncodes/php:5.6-fpm
docker push newtoncodes/php:7.1
docker push newtoncodes/php:7.1-fpm
docker push newtoncodes/php:7.2
docker push newtoncodes/php:7.2-fpm
