#!/bin/bash
clear
echo Installing Websocket-SSH Python
sleep 1
echo Sila Tunggu...
sleep 0.5
cd



#Install system auto run
#System OpenSSH Websocket-SSH Python
cd
cd /etc/systemd/system/
wget -O /etc/systemd/system/ws-openssh.service http://script.vpnmit.xyz/trial/main/websocket-python/ws-openssh.service
#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service http://script.vpnmit.xyz/trial/main/websocket-python/ws-dropbear.service
#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service http://script.vpnmit.xyz/trial/main/websocket-python/ws-stunnel.service
##System Websocket-OpenVPN Python
wget -O /etc/systemd/system/ws-ovpn.service http://script.vpnmit.xyz/trial/main/websocket-python/ws-ovpn.service

#Install Script Websocket-SSH Python
cd
cd /usr/local/bin/
wget -O /usr/local/bin/ws-openssh http://script.vpnmit.xyz/trial/main/websocket-python/ws-openssh && chmod +x /home/admin/ws-openssh
wget -O /usr/local/bin/ws-dropbear http://script.vpnmit.xyz/trial/main/websocket-python/ws-dropbear && chmod +x /home/admin/bin/ws-dropbear
wget -O /usr/local/bin/ws-stunnel http://script.vpnmit.xyz/trial/main/websocket-python/ws-stunnel && chmod +x /home/admin/ws-stunnel
wget -O /usr/local/bin/ws-ovpn http://script.vpnmit.xyz/trial/main/websocket-python/ws-ovpn && chmod +x /home/admin/ws-ovpn
#
chmod +x /usr/local/bin/ws-openssh

cd
#
cd
systemctl daemon-reload
#Enable & Start & Restart ws-openssh service
systemctl enable ws-openssh.service
systemctl start ws-openssh.service
systemctl restart ws-openssh.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-stunnel service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service


#Enable & Start ws-ovpn service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service
