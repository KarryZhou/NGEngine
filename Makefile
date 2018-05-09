pull:
	docker pull nginx:1.9.0
	docker pull php:5.6-fpm
	docker pull mysql:5.6
	docker pull redis:3.0
	docker pull memcached:1.4

dl:
	wget https://github.com/phalcon/cphalcon/archive/1.3.5.tar.gz -O php/extensions/cphalcon.tgz
	wget https://pecl.php.net/get/redis-2.2.7.tgz -O php/extensions/redis.tgz
	wget https://pecl.php.net/get/memcached-2.2.0.tgz -O php/extensions/memcached.tgz
	wget https://pecl.php.net/get/xdebug-2.3.2.tgz -O php/extensions/xdebug.tgz
	wget https://pecl.php.net/get/msgpack-0.5.6.tgz -O php/extensions/msgpack.tgz
	wget https://pecl.php.net/get/memcache-2.2.7.tgz -O php/extensions/memcache.tgz
	wget https://pecl.php.net/get/xhprof-0.9.4.tgz -O php/extensions/xhprof.tgz
	wget https://getcomposer.org/composer.phar -O php/extensions/composer.phar

build:
	make build-nginx
	make build-mysql
	make build-php

build-nginx:
	docker build -t nge/nginx ./nginx

run-nginx:
	docker run -i -d -p 80:80 -v ~/opt:/opt -t nge/nginx

in-nginx:
	docker run -i -p 80:80 -v ~/opt:/opt -t nge/nginx /bin/bash

build-php:
	docker build -t nge/php ./php

run-php:
	docker run -i -d -p 9000:9000 -v ~/opt:/opt -t nge/php

in-php:
	docker run -i -p 9000:9000 -v ~/opt:/opt -t nge/php /bin/bash

build-mysql:
	docker build -t nge/mysql ./mysql

run-mysql:
	docker run -i -d -p 3306:3306 -v ~/opt/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t nge/mysql

in-mysql:
	docker run -i -p 3306:3306  -v ~/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t nge/mysql /bin/bash

build-elasticsearch:
	docker build -t nge/elasticsearch ./elasticsearch

run-elasticsearch:
	docker run -i -d -p 9200:9200 -p 9300:9300 -v ~/opt/data/elasticsearch:/usr/share/elasticsearch/data -t nge/elasticsearch

in-elasticsearch:
	docker run -i -p 9200:9200 -p 9300:9300 -v ~/opt/data/elasticsearch:/usr/share/elasticsearch/data -t nge/elasticsearch /bin/bash


clean:
	docker rmi -f $(shell docker images | grep "<none>" | awk "{print \$3}")
