<?php
// automatically load all libraries (this file is generated by Composer)
require __DIR__ . '/lib/autoload.php';

// globals
$f3 = \Base::instance();
// Load configuration
$f3->set('DEBUG',1);
$f3->config('config.ini');

require __DIR__ . '/routes.php';

$f3->run();