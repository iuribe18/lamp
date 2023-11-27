
# Lamp
Web Stack Implementation (Linux AWS EC2, Apache, MySQL, PHP)

# Requirements
1. EC2 Instance
2. LAMP (Linux, Apacha, MySQL, PHP)

## Installation
Install Apache, mysql, PHP

```bash
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
```