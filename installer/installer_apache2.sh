#!/bin/bash
## ======== APACHE2 INSTALLER ========= ##
## =======++++ TUKANG KETIK ++++======= ##
#
# installing apache2 and certbot
sudo apt install certbot -y
sudo apt install python-certbot-apache -t stretch-backports -y
# configure apache2
sudo a2dissite 000-default.conf
sudo a2enmod rewrite
rm -rf /etc/apache2/sites-available/*
rm -rf /var/www/*
sudo chown -R www-data:devs /var/www/
sudo chmod -R 775 /var/www/
# create sample sites
git clone https://github.com/fathtech/maintenance.git /var/www/maintenance
touch /etc/apache2/sites-available/default.conf
cat >/etc/apache2/sites-available/default.conf <<EOF
<VirtualHost *80>
	ServerName your_domain
	ServerAdmin support@your_domain
	DocumentRoot /var/www/maintenance
	
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
sudo a2ensite default.conf
sudo service apache2 restart
"\e[32m✅ DONE enjoy your preconfig apache2!\e[0m"
