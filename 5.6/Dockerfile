FROM newtoncodes/ubuntu:16.04

RUN touch /etc/apt/sources.list.d/ondrej-php.list \
 && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" >> /etc/apt/sources.list.d/ondrej-php.list \
 && echo "deb-src http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" >> /etc/apt/sources.list.d/ondrej-php.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C

RUN apt-get update && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php5.6 php5.6-cli php5.6-common php5.6-curl php5.6-json php5.6-xml \
    php5.6-xmlrpc php5.6-opcache php5.6-mbstring php5.6-sqlite3 php5.6-zip php5.6-bcmath php5.6-mcrypt php5.6-bz2 php5.6-mysql \
    php5.6-readline php5.6-enchant php5.6-intl php5.6-gd php5.6-pgsql php-pear php-pecl-http php-crypt-blowfish php-crypt-cbc \
    php-crypt-chap php-crypt-gpg php-redis php-http php-imagick php-uuid php-memcache php-memcached php-mongodb php-yaml php-xcache
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs build-essential

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY config/php/cli/php.ini /etc/php/5.6/cli/php.ini
