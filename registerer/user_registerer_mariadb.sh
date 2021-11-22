#!/bin/bash
## ====== MARIADB USER REGISTERER ===== ##
## =======++++ TUKANG KETIK ++++======= ##
#
# config mariadb
MARIA_CONF=/etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/127.0.0.1/0.0.0.0/g" $MARIA_CONF
echo -e "\e[32m✅ remote database activated.. ok.\e[0m"
sudo service mysql restart
echo -e "\e[32m🙏 restarting database server.. please wait.\e[0m"
sleep 3
echo -e "\e[32m✅ creating database users...\e[0m"
read -p "Masukan username$: " username
read -p "Oke sekarang password$: " password
if [[ $? == 0 ]]; then
	echo -e "\e[32m✨ DATABASE SUCCESSFULLY CONFIGURED\e[0m"
	Q1="CREATE USER '${username}'@'%' IDENTIFIED BY '${password}';"
	Q2="GRANT ALL PRIVILEGES ON *.* TO '${username}'@'%';"
	Q3="FLUSH PRIVILEGES;"
	QUERYS="${Q1}${Q2}${Q3}"

	mysql -uroot -e "$QUERYS"
	echo -e "\e[32m🙏 creating username and database.. please wait.\e[0m"

	if [[ $? == 0 ]]; then
		sed -i "s/127.0.0.1/0.0.0.0/g" $MARIA_CONF
		echo -e "\e[32m✅ remote database activated.. ok.\e[0m"
		sudo service mysql restart
		echo -e "\e[32m🙏 restarting database server.. please wait.\e[0m"
		if [[ $? == 0 ]]; then
			echo -e "\e[32m✨ DATABASE SUCCESSFULLY CONFIGURED\e[0m"
			echo -e "\e[36m💌 Hooray! ${username} berhasil di daftarkan. Silahkan login menggunakan username: ${username} secara remote atau non remote.\e[0m"
			exit 0
		else
			echo -e "\e[31m‼️ DATABASE FAILED TO CONFIGURE\e[0m"
			exit 0
		fi
	else
		echo -e "\e[31m‼️ DATABASE FAILED TO CONFIGURE\e[0m"
		exit 0
	fi
else
	echo -e "\e[31m‼️ DATABASE FAILED TO CONFIGURE\e[0m"
	exit 0
fi
