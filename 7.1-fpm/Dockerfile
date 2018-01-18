FROM newtoncodes/php:7.1

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y php7.1-fpm \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl channel-update pecl.php.net

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY config/fpm/php.ini /etc/php/7.1/fpm/php.ini
COPY config/fpm/pool.d/www.conf /etc/php/7.1/fpm/pool.d/www.conf
