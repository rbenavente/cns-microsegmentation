#!/bin/bash
# Author - Alexandre S. Cezar

# Installing Wordpress and setting up the environment
sudo apt-get update -y && sudo apt-get upgrade -y && \
sudo apt-get install -y software-properties-common && \
sudo apt-get install -y apache2 && sudo apt-get install -y apache2-bin && \
sudo apt-get install -y wget && sudo apt-get -y install mariadb-client && \
#sudo locale-gen en_US.UTF-8 && \
#export LANG=en_US.UTF-8 && \
#sudo apt-get update && \
sudo add-apt-repository -y ppa:ondrej/php && \
sudo apt-get update -y && \
sudo apt-get install -y php7.4 && sudo apt-get install -y php7.4-curl && \
sudo apt-get install -y php7.4-bcmath && sudo apt-get install -y php7.4-intl && \
sudo apt-get install -y php7.4-gd && sudo apt-get install -y php7.4-dom && \
sudo apt-get install -y php7.4-mcrypt && sudo apt-get install -y php7.4-iconv && \
sudo apt-get install -y php7.4-xsl && \
sudo apt-get install -y php7.4-mbstring && sudo apt-get install -y php7.4-ctype && \
sudo apt-get install -y php7.4-zip && sudo apt-get install -y php7.4-pdo && \
sudo apt-get install -y php7.4-xml && sudo apt-get install -y php7.4-json && \
sudo apt-get install -y php7.4-bz2 && sudo apt-get install -y php7.4-calendar && \
sudo apt-get install -y php7.4-exif && sudo apt-get install -y php7.4-fileinfo && \
sudo apt-get install -y php7.4-json && \
sudo apt-get install -y php7.4-mysqli && sudo apt-get install -y php7.4-mysql && \
sudo apt-get install -y php7.4-posix && sudo apt-get install -y php7.4-tokenizer && \
sudo apt-get install -y php7.4-xmlwriter && sudo apt-get install -y php7.4-xmlreader && \
sudo apt-get install -y php7.4-phar && sudo apt-get install -y php7.4-soap && \
sudo apt-get install -y php7.4-mysql && sudo apt-get install -y php7.4-fpm && \
sudo apt-get install -y libapache2-mod-php7.4 && \
sudo sed -i -e"s/^memory_limit\s*=\s*128M/memory_limit = 512M/" /etc/php/7.4/apache2/php.ini && \
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
sudo systemctl stop ufw && sudo systemctl disable ufw && \
sudo systemctl enable apache2 && \
sudo systemctl start apache2