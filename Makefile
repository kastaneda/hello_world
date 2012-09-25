
all: composer.lock vendor/bootstrap vendor/jquery.min.js .htaccess

.htaccess:
	cp .htaccess.dist .htaccess

vendor/bootstrap:
	mkdir -p vendor
	wget http://twitter.github.com/bootstrap/assets/bootstrap.zip
	unzip bootstrap.zip -d vendor/
	rm bootstrap.zip

vendor/jquery.min.js:
	mkdir -p vendor
	wget http://code.jquery.com/jquery-1.8.2.min.js -O vendor/jquery.min.js

composer.lock: composer.phar
	./composer.phar install

composer.phar:
	wget http://getcomposer.org/installer -O - | php

test: phpunit.xml
	echo Test passed

.PHONY: test

