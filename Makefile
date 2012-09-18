all: vendor web/vendor/bootstrap web/vendor/jquery.min.js
 
web/vendor/bootstrap:
	mkdir -p web/vendor
	wget http://twitter.github.com/bootstrap/assets/bootstrap.zip
	unzip bootstrap.zip -d web/vendor/
	rm bootstrap.zip

web/vendor/jquery.min.js:
	mkdir -p web/vendor
	wget http://code.jquery.com/jquery-1.8.1.min.js -O web/vendor/jquery.min.js

vendor: composer.phar
	./composer.phar install

composer.phar:
	wget http://getcomposer.org/installer -O - | php

