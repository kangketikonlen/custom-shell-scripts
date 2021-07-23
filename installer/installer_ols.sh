#!/bin/bash
## ========== OLS INSTALLER =========== ##
## =======++++ TUKANG KETIK ++++======= ##
#
# downloading official scripts
wget -c http://rpms.litespeedtech.com/debian/enable_lst_debian_repo.sh &&
sudo bash enable_lst_debain_repo.sh &&
sudo apt install openlitespeed -y &&
# remove downloaded scripts
sudo rm -rf enable_lst_debain_repo.sh
# asking for username and password
sudo /usr/local/lsws/admin/misc/admpass.sh
"\e[32m✅ DONE enjoy your OLS!\e[0m"
