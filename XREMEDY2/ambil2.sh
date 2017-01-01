#!/bin/bash
# 2016 Muhammad Fathin Rahman -- This is free software
# REV00 Sun Jan 01 09:10:22 WIB 2017 Menyelesaikan script, mencetak ke dalam .txt
# START Sat Dec 31 16:23:21 WIB 2016
# Script ini digunakan untuk memeriksa isi URL tiap baris di berkas "ranking.txt"
# Melakukan text dump url lalu text dimasukkan ke file .txt baru

arrRank=()
arrURL=()

ranking="$(awk '{print $2}' ranking.txt)"
url="$(awk '{print $3}' ranking.txt)"

for valRank in $ranking ; do
    arrRank+=($valRank)
done

for valURL in $url ; do
    arrURL+=($valURL)
done


for (( i=0; i<${#arrRank[@]}; i++ )) ; do
    temp="$(w3m -dump ${arrURL[i]})"
    if [ -z "$temp" ]; then
        touch "${arrRank[i]}--GAGAL.txt"
    else
        w3m -dump -cols 1000 ${arrURL[i]} > "${arrRank[i]}.txt"
    fi
done

