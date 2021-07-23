#!/bin/bash
## ======= CORE USER REGISTERER ======= ##
## =======++++ TUKANG KETIK ++++======= ##
#
# asking for user information
echo -e "\e[32m✅ creating devs users...\e[0m"
read -p "Masukan username$: " username
read -s "Oke, sekarang password$: " password
sudo adduser --disabled-password --gecos "" username
if [[ $? == 0 ]]; then
	echo "${username}:${password}" | chpasswd
	echo -e "\e[32m✅ devs users created.. ok.\e[0m"
else
	echo -e "\e[32m✅ devs users exists or fail to create please create it manually.\e[0m"
fi
# assign user to devs group
usermod -aG sudo username
usermod -aG devs username
"\e[32m✅ DONE enjoy your preconfig user!\e[0m"
