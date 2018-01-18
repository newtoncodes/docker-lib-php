FROM newtoncodes/php:7.1

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y php7.1-fpm \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl channel-update pecl.php.net

COPY config/fpm/php.ini /etc/php/7.1/fpm/php.ini
COPY config/fpm/pool.d/www.conf /etc/php/7.1/fpm/pool.d/www.conf


EXPOSE 9000

COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["php-fpm"]
