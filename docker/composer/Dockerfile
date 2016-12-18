FROM php:7.1-cli

MAINTAINER "Ikezoe Makoto" <150283t@gmail.com>

RUN sed -i.bak -e "s%http://httpredir.debian.org/debian%http://ftp.jaist.ac.jp/debian%g" /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y vim emacs curl git zip \
    && apt-get install -y mysql-client \

    && apt-get install -y libicu-dev libmcrypt-dev zlib1g-dev libmemcached-dev memcached \
    && docker-php-ext-install mbstring mcrypt intl pdo_mysql mysqli zip \

    && git clone https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached \
    && cd /usr/src/php/ext/memcached \
    && git checkout -b php7 origin/php7 \
    && docker-php-ext-configure memcached \
    && docker-php-ext-install memcached \

    && echo "[Date]" > /usr/local/etc/php/php.ini \
    && echo "date.timezone = Asia/Tokyo" > /usr/local/etc/php/php.ini \

    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer self-update \
    && composer global require hirak/prestissimo

VOLUME ["/var/www/html"]
WORKDIR /var/www/html

ENTRYPOINT ["composer"]
CMD ["--help"]
