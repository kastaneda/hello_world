<?php

$app->get('/', function(Silex\Application $app) {
    return $app['twig']->render('hello_world.html.twig');
});
