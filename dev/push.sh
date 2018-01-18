#!/usr/bin/env bash

v="$1"

if [ "$v" = "" ] || [ "$v" = "5.6" ]; then
    docker push newtoncodes/php
    docker push newtoncodes/php:5.6
else
    docker push newtoncodes/php:${v}
fi
