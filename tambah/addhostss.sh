#!/bin/bash

echo "CHANGE DOMAIN?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) make install; break;;
        No ) exit;;
    esac
done
clear

rm -f /var/lib/crot-script/ipvps.conf
rm -f /etc/v2ray/domain
echo -e "\e[1;32m Masukkan Domain Anda \e[0m"
read -p "Hostname / Domain: " host
clear
mkdir /etc/v2ray
mkdir /var/lib/crot-script;
clear
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
echo -e "\e[1;32m Berjaya.SILA Renew Certificate Di MENU \e[0m"