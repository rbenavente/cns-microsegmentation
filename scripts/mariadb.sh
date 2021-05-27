#!/bin/bash
# Author - Alexandre S. Cezar

# Install the MariaDB Server and create the Wordpress DB and user
sudo apt-get update && sudo apt-get install -y mariadb-server && \
sudo mysql -h localhost -u root < /tmp/create_db.sql