#!/bin/bash
## ========= MARIADB INSTALLER ======== ##
## =======++++ TUKANG KETIK ++++======= ##
#
### setup variables
MARIADB_VER=10.5
# install latest mariadb
sudo apt -y install software-properties-common dirmngr
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
sudo add-apt-repository "deb [arch=amd64,i386,ppc64el] http://mirror.zol.co.zw/mariadb/repo/${MARIADB_VER}/debian stretch main"
sudo apt update && sudo apt install mariadb-server mariadb-client -y
"\e[32m✅ DONE enjoy your MariaDB!\e[0m"
