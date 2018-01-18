FROM newtoncodes/php:5.6

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y php5.6-fpm \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl channel-update pecl.php.net
RUN pecl install v8js-0.6.4

#RUN echo "extension=v8js.so" >> /etc/php/5.6/fpm/conf.d/20-v8js.ini
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY config/fpm/php.ini /etc/php/5.6/fpm/php.ini
COPY config/fpm/pool.d/www.conf /etc/php/5.6/fpm/pool.d/www.conf
