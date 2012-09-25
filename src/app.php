<?php

$app = new Silex\Application();

$app->get('/', function() {
    return 'Hello world';
});

return $app;

