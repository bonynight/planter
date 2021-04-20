FROM php:8-fpm

#CMD mkdir -p /var/www/html

RUN apt update
RUN apt upgrade -y
RUN apt install -y apt-utils wget git libxml2-dev libicu-dev

RUN docker-php-ext-install xml ctype iconv session simplexml tokenizer pdo pdo_mysql calendar exif
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN pecl install apcu-5.1.17
RUN docker-php-ext-enable apcu

WORKDIR /usr/share/nginx/html

ADD php.ini /usr/local/etc/php/conf.d/zzz_php.ini

ADD composer_install.sh /usr/bin/composer_install.sh
RUN chmod +x /usr/bin/composer_install.sh
RUN /bin/bash -c "/usr/bin/composer_install.sh"
RUN mv composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer
RUN mkdir -p /var/www/.composer/cache/ \
    && chown www-data:1000 /var/www/.composer/cache/

RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony
RUN chmod +x /usr/local/bin/symfony

ADD usermod.sh /usr/local/bin/usermod.sh
RUN chmod +x /usr/local/bin/usermod.sh



ENTRYPOINT ["usermod.sh"]




