#!/bin/bash


# DB_NAME="wordpress_db"
# DB_USER="wordpress_user"
# DB_PASS="wordpress_password"
# WORDPRESS_ADMIN_USER="abdel-ou"
# WORDPRESS_ADMIN_PASS="lolabdel-ou@123"
# WORDPRESS_ADMIN_EMAIL="lol@gmail.lol"
# WORDPRESS_EDITOR_USER="xeditor"
# WORDPRESS_EDITOR_PASS="editor@123"
# WORDPRESS_EDITOR_EMAIL="xeditor@lol.com"
# DOMAIN_NAME="lol.tatbiqi.xyz"


# if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    echo "File does not exist, running wp core config..."
    wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --dbprefix=wp_ --allow-root
    wp core install --url=$DOMAIN_NAME --title="Sample site" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root;
    wp user create $WORDPRESS_EDITOR_USER $WORDPRESS_EDITOR_EMAIL --role=editor --user_pass=$WORDPRESS_EDITOR_PASS --allow-root
    
# else
#     echo "File exists, not running wp core config..."
# fi



exec php-fpm8.2 -F


