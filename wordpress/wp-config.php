<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'dev' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pass' );

/** MySQL hostname */
define( 'DB_HOST', 'c2.mine' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'u#v&!L9Wq=WQMjjA06;}9~JXAp`lbDqeQy9<vdK}*.M)d1K&;7``CzX+Z_HP[/h(' );
define( 'SECURE_AUTH_KEY',  '/R[3DDO}w5NN:1]QF35uq<Ck] 1,9GrEc^4%c51,5hHG7zZRMVx9Qs,)V~r@Iol%' );
define( 'LOGGED_IN_KEY',    '9&KIiTZVT<) 5$6xfyc@#)j{Bw}>N5Fw#W?!jIC2q/-XaTO!&yO24`IOUI3cOj3[' );
define( 'NONCE_KEY',        'eS(+F^wwHiGx:ys_ws]>-&kA|gTlLfdFT.QLu;2UV|H3FJtY;tUNo2!*#rU7O+-n' );
define( 'AUTH_SALT',        '>bkecjqP(b;/2_W8#4Pd1Z>n`}wlpJy4;K-A<ru-FSQ9,MaG>E$Co<OiMj,O%4ba' );
define( 'SECURE_AUTH_SALT', ')d|;u&-opJ0OBoX_doCJ5-y<wI4I.MPZiwSfP{++Z=Rua34jRM/!u^~1|hyu*0(9' );
define( 'LOGGED_IN_SALT',   '@}CZ.XnA^AP{`Y6SWB<-f!<Q~(p#lX;a5Qfk+i+5+p[;ij15=On9jR-%%xPoas4L' );
define( 'NONCE_SALT',       '&Z0]w(ZWF7a]GKSr41^No/BhUe>xd>M.tCL;CQb1(1M7lexg>w15NxBh^>#TgX=!' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
