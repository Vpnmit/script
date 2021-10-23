#!/bin/bash
clear
echo " "
echo "===========================================";
echo " ";
if [ -e "/root/log-limit.txt" ]; then
echo "User MultiLogin";
echo "Waktu - Username - Jumlah Multilogin"
echo "-------------------------------------";
cat /root/log-limit.txt
else
echo " Tidak ada pengguna yang melakukan pelanggaran"
echo " "
echo " atau"
echo " "
echo " Script User-Limit belum dijalankan"
fi
echo " ";
echo "===========================================";
echo "Mod BY VPNMIT";
echo " ";
