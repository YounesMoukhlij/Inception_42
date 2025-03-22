<?php

define( 'DB_NAME', 'wordpress_db' );
define( 'DB_USER', 'youmoukh' );
define( 'DB_PASSWORD', '656656' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define('WP_HOME','https://youmoukh.42.fr');
define('WP_SITEURL','https://youmoukh.42.fr');
define( 'AUTH_KEY',         '' );
define( 'SECURE_AUTH_KEY',  '' );
define( 'LOGGED_IN_KEY',    '' );
define( 'NONCE_KEY',        '' );
define( 'AUTH_SALT',        '' );
define( 'SECURE_AUTH_SALT', '' );
define( 'LOGGED_IN_SALT',   '' );
define( 'NONCE_SALT',       '' );

define( 'WP_REDIS_HOST', 'redis');
define( 'WP_REDIS_PORT', 6379);
define('WP_REDIS_TIMEOUT', 1); 
define( 'WP_REDIS_DISABLED', false);    
define('WP_REDIS_PASSWORD', '');  
define('WP_REDIS_DATABASE', 0);   

$table_prefix = 'wp_';

if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';