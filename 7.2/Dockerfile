FROM newtoncodes/ubuntu:16.04

RUN touch /etc/apt/sources.list.d/ondrej-php.list \
 && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" >> /etc/apt/sources.list.d/ondrej-php.list \
 && echo "deb-src http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" >> /etc/apt/sources.list.d/ondrej-php.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C

RUN apt-get update && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php7.2 php7.2-cli php7.2-common php7.2-curl php7.2-json php7.2-xml \
    php7.2-xmlrpc php7.2-opcache php7.2-mbstring php7.2-sqlite3 php7.2-zip php7.2-bcmath php7.2-mcrypt php7.2-bz2 php7.2-mysql \
    php7.2-readline php7.2-enchant php7.2-intl php7.2-gd php7.2-pgsql php-pear php-pecl-http php-crypt-blowfish php-crypt-cbc \
    php-crypt-chap php-crypt-gpg php-redis php-http php-imagick php-uuid php-memcache php-memcached php-mongodb php-yaml php-xcache
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs build-essential

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY config/cli/php.ini /etc/php/7.2/cli/php.ini


COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/bin/bash"]
