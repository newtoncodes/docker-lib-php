FROM newtoncodes/php:5.6-fpm

RUN DEBIAN_FRONTEND="noninteractive" add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nginx supervisor \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/vhosts/default.conf /etc/nginx/vhosts/default.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/log/supervisor

RUN rm -rf /var/www
COPY www /var/www


EXPOSE 80 443

COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["supervisord"]
