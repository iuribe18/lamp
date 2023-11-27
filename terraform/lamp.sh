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