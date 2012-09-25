<?php

require_once __DIR__ . '/../vendor/autoload.php';

$app = require __DIR__ . '/../src/app.php';
require __DIR__ . '/../src/controllers.php';
require __DIR__ . '/../config.php';
$app->run();

