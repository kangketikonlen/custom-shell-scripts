#!/bin/bash
## ========== CORE INSTALLER ========== ##
## =======++++ TUKANG KETIK ++++======= ##
#
### perl warning fix
apt install sudo net-tools -y
localedef -i en_US -f UTF-8 en_US.UTF-8
sudo timedatectl set-timezone Asia/Jakarta
cat >/etc/environment <<EOF
LANG=en_US.utf-8
LC_ALL=en_US.utf-8
EOF
echo 'LANG=en_US.utf-8' >>~/.bashrc
echo 'LC_ALL=en_US.utf-8' >>~/.bashrc
source ~/.bashrc
### disable ipv6 because it's buggy here.
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >>/etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6 = 1' >>/etc/sysctl.conf
echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >>/etc/sysctl.conf
echo 1 >/proc/sys/net/ipv6/conf/default/disable_ipv6
echo 1 >/proc/sys/net/ipv6/conf/all/disable_ipv6
### add additional sources.
echo 'deb http://ftp.debian.org/debian stretch-backports main' >>/etc/apt/sources.list
sudo apt update && sudo apt upgrade -y
# installing additional apps
sudo apt install htop atop iftop git ufw -y
# configure firewall
ufw allow ssh
ufw allow 80
ufw allow 443
ufw allow 3306
ufw allow 14045
# configure users & folders
sed -i "s/#Port 22/Port 14045/g" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config
sudo service ssh restart
sudo addgroup devs
"\e[32m✅ DONE enjoy your preconfig VPS!\e[0m"
