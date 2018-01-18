FROM newtoncodes/ubuntu:16.04

RUN touch /etc/apt/sources.list.d/ondrej-php.list \
 && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" >> /etc/apt/sources.list.d/ondrej-php.list \
 && echo "deb-src http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" >> /etc/apt/sources.list.d/ondrej-php.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C

RUN apt-get update && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php7.1 php7.1-cli php7.1-common php7.1-curl php7.1-json php7.1-xml \
    php7.1-xmlrpc php7.1-opcache php7.1-mbstring php7.1-sqlite3 php7.1-zip php7.1-bcmath php7.1-mcrypt php7.1-bz2 php7.1-mysql \
    php7.1-readline php7.1-enchant php7.1-intl php7.1-gd php7.1-pgsql php-pear php-pecl-http php-crypt-blowfish php-crypt-cbc \
    php-crypt-chap php-crypt-gpg php-redis php-http php-imagick php-uuid php-memcache php-memcached php-mongodb php-yaml php-xcache
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs build-essential

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY config/cli/php.ini /etc/php/7.1/cli/php.ini
