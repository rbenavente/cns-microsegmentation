#!/bin/bash
# Author - Alexandre S. Cezar

# Install the MariaDB Server and create the Wordpress DB and user
sudo apt-get update && sudo apt-get upgrade && \
sudo apt-get install -y mariadb-server && \
sudo systemctl stop ufw && sudo systemctl disable ufw && \
sudo systemctl enable mariadb.service && \
sudo mysql -h localhost -u root < /tmp/create_db.sql