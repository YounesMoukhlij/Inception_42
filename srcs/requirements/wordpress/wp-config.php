<?php
define( 'DB_NAME', 'CHNAME');
define( 'DB_USER', 'CHUSER');
define( 'DB_PASSWORD', 'CHPASS');
define( 'DB_HOST', 'CHHOST');
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('WP_HOME','https://youmoukh.42.fr');
define('WP_SITEURL','https://youmoukh.42.fr');
define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );

sed -i "define( 'WP_REDIS_HOST', 'redis');
define( 'WP_REDIS_PORT', 6379);
define( 'WP_REDIS_DISABLED', false);    
define( 'WP_CACHE', true);  

$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';