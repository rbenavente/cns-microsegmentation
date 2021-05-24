CREATE DATABASE wordpress;
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'my_password1';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';
FLUSH PRIVILEGES;
exit