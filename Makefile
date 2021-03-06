
all: composer.lock \
	config.php \
	web/vendor/bootstrap \
	web/vendor/jquery.min.js \
	web/vendor/html5.js \
	web/.htaccess

config.php: config.php.dist
	cp config.php.dist config.php

web/.htaccess: htaccess.dist
	cp htaccess.dist web/.htaccess

web/vendor/bootstrap:
	mkdir -p web/vendor
	wget http://twitter.github.com/bootstrap/assets/bootstrap.zip
	unzip bootstrap.zip -d web/vendor/
	rm bootstrap.zip

web/vendor/jquery.min.js:
	mkdir -p web/vendor
	wget http://code.jquery.com/jquery-1.8.2.min.js \
		-O web/vendor/jquery.min.js

web/vendor/html5.js:
	mkdir -p web/vendor
	wget http://html5shim.googlecode.com/svn/trunk/html5.js \
		-O web/vendor/html5.js

composer.lock: composer.json composer.phar
	./composer.phar update
	touch composer.lock

composer.phar:
	wget http://getcomposer.org/installer -O - | php

test: phpunit.xml vendor/symfony/browser-kit
	phpunit

phpunit.xml:
	cp phpunit.xml.dist phpunit.xml

vendor/symfony/browser-kit: composer.lock
	./composer.phar update --dev
	touch vendor/symfony/browser-kit/

fix: php-cs-fixer.phar
	./php-cs-fixer.phar fix .

php-cs-fixer.phar:
	wget http://cs.sensiolabs.org/get/php-cs-fixer.phar
	chmod +x php-cs-fixer.phar

clean:
	rm -rf vendor/
	rm -rf web/vendor/
	rm -f composer.lock
	rm -f composer.phar
	rm -rf build/

dist-clean: clean
	rm web/.htaccess
	rm config.php
	rm phpunit.xml

.PHONY: test fix clean dist-clean
