#!/bin/bash

curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "http://script.vpnmit.xyz/trial/main/rclone.conf"
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user corloussss@gmail.com
from corloussss@gmail.com
password vmlpmbagegqzhsqy
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "http://script.vpnmit.xyz/trial/main/autobackup.sh"
wget -O backup "http://script.vpnmit.xyz/trial/main/backup.sh"
wget -O bckp "http://script.vpnmit.xyz/trial/main/bckp.sh"
wget -O restore "http://script.vpnmit.xyz/trial/main/restore.sh"
wget -O strt "http://script.vpnmit.xyz/trial/main/strt.sh"
wget -O limit-speed "http://script.vpnmit.xyz/premium/limit-speed.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x strt
chmod +x limit-speed
cd
rm -f /root/set-br.sh
