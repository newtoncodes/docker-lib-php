FROM newtoncodes/php:7.2

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y php7.2-fpm \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl channel-update pecl.php.net

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY config/fpm/php.ini /etc/php/7.2/fpm/php.ini
COPY config/fpm/pool.d/www.conf /etc/php/7.2/fpm/pool.d/www.conf
