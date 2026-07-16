#!/bin/bash
# Guides: https://hub.docker.com/hardened-images/catalog/dhi/mysql/guides
# $ mysql --help
#  Will display all default settings
# 
# Configuration file locations:
#   /etc/my.cnf
#   /etc/mysql/my.cnf
#   /out/opt/mysql/etc/my.cnf
#   ~/.my.cnf 
#
# Environment variables
#   DEBIAN_FRONTEND=noninteractive
#   MYSQLDATA=/var/lib/mysql
#   PATH=/opt/mysql/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#
# Ports:
#   3306/tcp
#   33060/tcp
#
# Entrypoint=/usr/local/bin/docker-entrypoint.sh
# Working directory=/var/www/html
# CMD=mysqld
# User=65532
# dates release: "2026-04-21"
# VERSION: 9.7.1

# Debug:
# $ docker run --rm -it dhi.io/mysql:lts-debian13 bash
#-----------------------------------------------------------------


# Create mount directory on the host system
mkdir -p /home/app/mysql
sudo chown -R 65532:65532 /home/app/mysql
