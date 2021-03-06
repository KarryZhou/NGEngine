FROM php:5.6-fpm

# Install env
ADD sources.list    /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        git \
        libmemcached-dev \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        && rm -r /var/lib/apt/lists/*


# Install PHP extensions
COPY extensions/memcached.tgz /home/memcached.tgz
COPY extensions/redis.tgz /home/redis.tgz
COPY extensions/msgpack.tgz /home/msgpack.tgz
COPY extensions/xdebug.tgz /home/xdebug.tgz
COPY extensions/memcache.tgz /home/memcache.tgz
COPY extensions/xhprof.tgz /home/xhprof.tgz
COPY extensions/cphalcon.tar.gz /home/cphalcon.tar.gz

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install zip \
        && docker-php-ext-install gd \
        && docker-php-ext-install mbstring \
        && docker-php-ext-install mcrypt \
        && docker-php-ext-install pdo_mysql
RUN pecl install /home/memcached.tgz && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini \
        && pecl install /home/redis.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
        && pecl install /home/msgpack.tgz && echo "extension=msgpack.so" > /usr/local/etc/php/conf.d/msgpack.ini \
        && pecl install /home/memcache.tgz && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/memcache.ini \
        && pecl install /home/xhprof.tgz && echo "extension=xhprof.so" > /usr/local/etc/php/conf.d/xhprof.ini \
        && pecl install /home/xdebug.tgz && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini
RUN cd /home \
    && tar -xvf cphalcon.tar.gz \
    && mv cphalcon-* phalcon \
    && cd phalcon/build && ./install && echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini

# Composer
ADD extensions/composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer
	
# PHP config
ADD php.ini    /usr/local/etc/php/php.ini
ADD php-fpm.conf    /usr/local/etc/php-fpm.conf


WORKDIR /opt

# Write Permission
RUN usermod -u 1000 www-data

EXPOSE 9000
VOLUME ["/opt"]
