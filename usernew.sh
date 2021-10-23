#!/bin/bash

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

domain=$(cat /etc/v2ray/domain);
IP=$(wget -qO- ipinfo.io/ip);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
echo Script AutoCreate SSH dan OpenVPN Mod By VPNMIT
sleep 1
echo Ping Host
echo Sila Tunggu...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akaun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Thank You For Using Our Services"
echo -e "SSH & OpenVPN"
echo -e "Username          : $Login "
echo -e "Password          : $Pass"
echo -e "==============================="
echo -e "IP Server         : $IP"
echo -e "Host              : $domain"
echo -e "OpenSSH           : 22, 500"
echo -e "Dropbear          : 143, 109"
echo -e "WS-SSH            : 8880"
echo -e "WS-SSH SSL/TLS    : 444"
echo -e "SSL/TLS           : $ssl"
echo -e "BadVPN/UDPGW      : 7100, 7200, 7300"
echo -e "Squid             : $sqd (limit to IP SSH)" 
echo -e "OpenVPN           : TCP $ovpn http://$IP:81/client-tcp-1194.ovpn"
echo -e "OpenVPN           : UDP $ovpn2 http://$IP:81/client-udp-2200.ovpn"
echo -e "OpenVPN           : SSL 992 http://$IP:81/client-tcp-ssl.ovpn"
echo -e "==============================="
echo -e "Aktif Sehingga      : $exp"
echo -e "==============================="
echo -e "Payload Default WS:"
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "===== Script Mod by VPNMIT====="
