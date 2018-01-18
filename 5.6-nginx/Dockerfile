FROM newtoncodes/php:5.6-fpm

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y  supervisor \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/log/supervisor


EXPOSE 80 443

COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["supervisord"]
