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


### Create mount directory on the host system
mkdir -p /home/app/mysql
sudo chown -R 65532:65532 /home/app/mysql


### Create the Certificate Authority (CA): 
# Generate CA Private Key
openssl genrsa 2048 > ca-key.pem

# Generate CA Certificate
openssl req -new -x509 -nodes -days 3650 -key ca-key.pem -out ca.pem -subj '/C=US/ST=state/L=city/O=example/OU=Sale-Dept/CN=server.example.com/emailAddress=your@example.com'


### Create the Server Certificate:
# Generate Server Private Key
openssl req -newkey rsa:2048 -nodes -days 3650 -keyout server-key.pem -out server-req.pem -subj '/C=US/ST=state/L=city/O=example/OU=Sale-Dept/CN=server.example.com/emailAddress=your@example.com'

# Sign the Server Certificate with the CA
openssl x509 -req -days 3650 -in server-req.pem -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem


### Create the Client Certificate:
# Generate Client Private Key
openssl req -newkey rsa:2048 -days 3650 -nodes -keyout client-key.pem -out client-req.pem -subj '/C=US/ST=state/L=city/O=example/OU=Sale-Dept/CN=client.example.com/emailAddress=your@example.com'

# Sign the Client Certificate with the CA
openssl x509 -req -days 3650 -in client-req.pem -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out client-cert.pem



