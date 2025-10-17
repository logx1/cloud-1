#!/bin/bash

# DB_NAME="wordpress_db"
# DB_USER="wordpress_user"
# DB_PASS="wordpress_password"


echo $DB_NAME
if [ ! -d "/var/lib/mysql/wpdb" ]; then
	cat << lol > init
	flush privileges;
	create database $DB_NAME;
	create user '$DB_USER'@'%' identified by '$DB_PASS';
	grant all privileges on $DB_NAME.* to '$DB_USER'@'%' identified by '$DB_PASS';
	flush privileges;
lol
	mariadbd --user=mysql --bootstrap < init
	rm init
	echo "Database created successfully!"
else
	echo "Error: Database created "
fi

exec "$@"
