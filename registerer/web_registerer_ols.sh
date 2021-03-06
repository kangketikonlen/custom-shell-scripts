#!/bin/bash
## ======== OLS WEB REGISTERER ======== ##
## =======++++ TUKANG KETIK ++++======= ##
#
# asking app informations
echo -e "\e[32mâ assign new app...\e[0m"
read -p "Masukan app name: " app_name
read -p "Masukan git url: " git_url
### Creating folders
WWW_FOLD=/var/www/${app_name}
CONF_FOLD=/usr/local/lsws/conf/vhosts/${app_name}
DEFAULT_CONF_FOLD=ols_default

if [[ -d "$WWW_FOLD" ]]; then
    echo "ð Folder already exists. Skipped.."
else
    mkdir -p "${WWW_FOLD}" && mkdir -p "${WWW_FOLD}/html"
    git clone ${git_url} ${WWW_FOLD}/repo/
    git clone ${git_url} ${WWW_FOLD}/html/
    echo "â Folder created successfully!"
fi

if [ -d ${CONF_FOLD} ]; then
    echo "ð File already exists. Skipped.."
    chown -R lsadm:nogroup ${CONF_FOLD}
else
    cp -r ${DEFAULT_CONF_FOLD} ${CONF_FOLD}
    chown -R lsadm:nogroup ${CONF_FOLD}
fi

if [ $? -eq 0 ]; then
    echo "â DONE Edit manualy from your ip_address:7080"
else
    echo "â ï¸  ERROR!"
fi
