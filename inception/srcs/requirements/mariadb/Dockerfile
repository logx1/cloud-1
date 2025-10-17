FROM	debian:bookworm

RUN echo "deb http://ftp.us.debian.org/debian/ bookworm main" > /etc/apt/sources.list


RUN	apt-get update && apt-get install -y mariadb-server


RUN	sed -i 's#bind-address\s*= 127.0.0.1#bind-address = 0.0.0.0#' /etc/mysql/mariadb.conf.d/50-server.cnf


RUN	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY	./tools/create_db.sh /

ENTRYPOINT	["bash", "/create_db.sh"]

# Use mysqld to run MariaDB
CMD ["mysqld", "--user=mysql", "--bind-address=0.0.0.0"]
