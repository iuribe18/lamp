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
sudo mysql_secure_installation