<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'cl44-wordadmin');

/** MySQL database username */
define('DB_USER', 'cl44-wordadmin');

/** MySQL database password */
define('DB_PASSWORD', 'X93EGWzeLiBo3Zd');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'N|eMJWCI`-N9Nlf0+L%/dH f zuYv@Cj,;g.e@8lN^DP+5&SE c3ZQ/OkEd7ScC-');
define('SECURE_AUTH_KEY',  '~n[5-HgXeF)x 54)h7H7x;5CqtdP,BQbQt(9t+RF9!W:^zUCr|y+}MwTPB9aLRr7');
define('LOGGED_IN_KEY',    'yN+..MH{kLO.`|xvF[Eeu(gX)I&V/_r_JL1 zJjJ`6zimaal 91c+58~Z<oX/_,h');
define('NONCE_KEY',        'Mu==7=|)ik[/h|Ky2+lU=6-`~Bk)&C<:I<-xBjPs$(^AKDeIcK,?*1~|DE%Z746q');
define('AUTH_SALT',        'Q`?y8tb{P|*1<h!JjP?F$ipEE1)F<$zbgRPCx?u2+nN}yPQd:R KtC!,2nkT])qm');
define('SECURE_AUTH_SALT', 'WM2md`1XIf*spEl#`1GqU2S)j1Id )$Ju3Oy&bQ.UGiZN5<`rbom7@IWD,=~!I2e');
define('LOGGED_IN_SALT',   '@Bk0aXnU{1VL9.|l=~Ybctk]P)8/D+>F5N%e1>|mhV{-x{:EojAR-.PXgoCO#e`h');
define('NONCE_SALT',       'qp($hV !-wH1U0IAXPN-<Sk* KJg0/LQ#J<py;El^{L@SR}]*4A&;w{cqX+2:Ea/');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
