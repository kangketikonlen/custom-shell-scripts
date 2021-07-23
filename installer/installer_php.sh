#!/bin/bash
## ========== PHP INSTALLER =========== ##
## =======++++ TUKANG KETIK ++++======= ##
#
### setup variables
PHP_VER=7.4
### installing lattest PHP.
sudo apt -y install lsb-release apt-transport-https ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update && sudo apt upgrade -y && sudo apt -y install php${PHP_VER}
sudo apt-get install php${PHP_VER}-{bcmath,bz2,intl,gd,mbstring,mysql,zip} -y
"\e[32m✅ DONE enjoy your PHP!\e[0m"
