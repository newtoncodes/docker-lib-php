FROM newtoncodes/php:5.6

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y php5.6-fpm \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl channel-update pecl.php.net

COPY config/fpm/php.ini /etc/php/5.6/fpm/php.ini
COPY config/fpm/pool.d/www.conf /etc/php/5.6/fpm/pool.d/www.conf


COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["php-fpm"]
