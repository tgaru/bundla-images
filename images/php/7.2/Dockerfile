FROM tonyyb/laravel-php:7.2

MAINTAINER tgaru <tgagoldbox@gmail.com>

ENV APP_PATH /var/www/html

RUN apk add --no-cache \
    supervisor \
    nano \
    tmux \
    && pecl bundle -d /usr/src/php/ext redis \
    && rm /usr/src/php/ext/redis-*.tgz \
    && docker-php-ext-install \
      $PHP_EXT_DEPS \
      redis \
      sockets

WORKDIR ${APP_PATH}

COPY ./configs/supervisord.conf /etc/supervisord.conf
COPY ./scripts/php/start.sh /usr/local/bin/start

RUN chown -R www-data:www-data ${APP_PATH} \
    && chmod u+x /usr/local/bin/start

CMD ["/usr/local/bin/start"]
EXPOSE 9000

