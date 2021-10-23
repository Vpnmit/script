#!/bin/bash
#Script untuk menghapus user SSH & OpenVPN

read -p "Sila Masukkan Nama User untuk Delete : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e "User $Pengguna Deleted."
else
        echo -e "GAGAL: User $Pengguna tidak ada."
fi
