FROM mysql:5.7

MAINTAINER "Ikezoe Makoto" <150283t@gmail.com>

ARG mysql_root_password

RUN /usr/bin/mysql_tzinfo_to_sql /usr/share/zoneinfo > /tmp/timezone.sql \
    && mysql mysql -u root -p $mysql_root_password < /tmp/timezone.sql; exit 0;

ADD mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

