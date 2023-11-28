#!/bin/bash
#update a list of packages in package manager
sudo apt update

#run apache2 package installation
sudo apt install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2

#run mysql-server package installation
sudo apt install mysql-server -y

# Start the interactive script by running
# sudo mysql_secure_installation

# Establece tu contraseña deseada
MYSQL_ROOT_PASSWORD='S@nt1Ur1b3'

# Comandos para asegurar la instalación automáticamente
sudo mysql -e "UPDATE mysql.user SET authentication_string=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';"
sudo mysql -e "DELETE FROM mysql.user WHERE User='';"
sudo mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
sudo mysql -e "DROP DATABASE IF EXISTS test;"
sudo mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Reinicia el servidor MySQL para aplicar los cambios
sudo systemctl restart mysql

# PHP
sudo apt -y install php libapache2-mod-php php-mysql

## Creating a Virtual Host for your Website Using Apache
# Create the directory
sudo mkdir /var/www/lamp
# Asign ownership of the directory with ypur current system user
sudo chown -R $USER:$USER /var/www/lamp
# Create a configuration file in Apache's aites-available directory 
nano /etc/apache2/sites-available/lamp.conf

<VirtualHost *:80>
    ServerName lamp
    ServerAlias www.lamp
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/lamp
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

# Enable virtual Host
sudo a2ensite lamp
# Output: 
#Enabling site lamp.
#To activate the new configuration, you need to run:
#  systemctl reload apache2

# Disable default website
sudo a2dissite 000-default
# Output: 
#Enabling site lamp.
#To activate the new configuration, you need to run:
#  systemctl reload apache2

# Make sure your config file doesn't contain syntax errors
sudo apache2ctl configtest
# Output: Syntax OK

# Reboot Apache
sudo systemctl reload apache2

# Website is now active, but the web root /var/www/lamp/ is still empty.
# Create an index.html file in that location so that we can test that the virtual host works as expected
sudo echo 'Hello from Hostname' $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) 'with Public IP' $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/lamp/index.html

# Enable PHP
sudo vi sudo vi /etc/apache2/mods-enabled/dir.conf

# Reboot Apache
sudo systemctl reload apache2

# Create a new file index.php
vi /var/www/lamp/index.php

<?php
phpinfo();