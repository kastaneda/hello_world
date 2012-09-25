
all: composer.lock \
	config.php \
	web/vendor/bootstrap \
	web/vendor/jquery.min.js \
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
	wget http://code.jquery.com/jquery-1.8.2.min.js -O web/vendor/jquery.min.js

composer.lock: composer.phar
	./composer.phar install

composer.phar:
	wget http://getcomposer.org/installer -O - | php

