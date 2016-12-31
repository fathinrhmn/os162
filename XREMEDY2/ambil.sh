#!/bin/bash
# (c) 2016 Muhammad Fathin Rahman -- This is free software
# REV02 Sat Dec 31 19:30:22 WIB 2016 - remove START and STOP berkas.
# REV01 Thu Dec 29 21:45:28 WIB 2016 - remove "[DISK]"
# REV00 Thu Dec 29 20:35:41 WIB 2016 - remove "ZCZC" and "NNNN"
# START Thu Dec 29 15:11:21 WIB 2016
# Script ini digunakan untuk ekstraksi halaman web http://os162.vlsm.org/2016/11/ranking-os162.html
# Mengambil urutan ranking lalu disimpan ke dalam ranking.txt

temp=`w3m -dump -cols 130 http://os162.vlsm.org/2016/11/ranking-os162.html | sed -n '/ZCZC/,/NNNN/p' | sed '/ZCZC/,+0 d' | sed '/NNNN/,+0 d' | sed '/DISK/,+0 d'`
echo "$temp" > ranking.txt
