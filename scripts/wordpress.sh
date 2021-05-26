#!/bin/bash

# Installing Wordpress and setting up the environment
sudo apt-get update -y && sudo apt-get install -y software-properties-common && \
sudo apt-get install -y apache2 && sudo apt-get install -y apache2-bin && \
sudo apt-get install -y wget && sudo apt-get -y install mariadb-client && \
#sudo locale-gen en_US.UTF-8 && \
#export LANG=en_US.UTF-8 && \
#sudo apt-get update && \
sudo add-apt-repository -y ppa:ondrej/php && \
sudo apt-get update && \
sudo apt-get install -y php7.0 && sudo apt-get install -y php7.0-curl && \
sudo apt-get install -y php7.0-bcmath && sudo apt-get install -y php7.0-intl && \
sudo apt-get install -y php7.0-gd && sudo apt-get install -y php7.0-dom && \
sudo apt-get install -y php7.0-mcrypt && sudo apt-get install -y php7.0-iconv && \
sudo apt-get install -y php7.0-xsl && sudo apt-get install -y && \
sudo apt-get install -y php7.0-mbstring && sudo apt-get install -y php7.0-ctype && \
sudo apt-get install -y php7.0-zip && sudo apt-get install -y php7.0-pdo && \
sudo apt-get install -y php7.0-xml && sudo apt-get install -y php7.0-json && \
sudo apt-get install -y php7.0-bz2 && sudo apt-get install -y php7.0-calendar && \
sudo apt-get install -y php7.0-exif && sudo apt-get install -y php7.0-fileinfo && \
sudo apt-get install -y php7.0-json && sudo apt-get install -y && \
sudo apt-get install -y php7.0-mysqli && sudo apt-get install -y php7.0-mysql && \
sudo apt-get install -y php7.0-posix && sudo apt-get install -y php7.0-tokenizer && \
sudo apt-get install -y php7.0-xmlwriter && sudo apt-get install -y php7.0-xmlreader && \
sudo apt-get install -y php7.0-phar && sudo apt-get install -y php7.0-soap && \
sudo apt-get install -y php7.0-mysql && sudo apt-get install -y php7.0-fpm && \
sudo apt-get install -y libapache2-mod-php7.0 && \
sudo sed -i -e"s/^memory_limit\s*=\s*128M/memory_limit = 512M/" /etc/php/7.0/apache2/php.ini && \
sudo a2enmod rewrite && \
sudo a2enmod headers && \
sudo service apache2 restart && \
cd /var/www/html && \
sudo wget https://wordpress.org/latest.tar.gz && \
sudo tar -zxvf latest.tar.gz && \
sudo cp -r wordpress/* /var/www/html/ && \
sudo rm -rf wordpress && \
sudo rm -rf latest.tar.gz && \
sudo chmod -R 755 wp-content && \
sudo chown -R www-data:www-data wp-content && \
sudo chown -Rv www-data.www-data /var/www/html/ && \
sudo chmod -R 755 wp-content && \
sudo rm -rf index.html && \
sudo systemctl enable apache2 && \
sudo systemctl start apache2