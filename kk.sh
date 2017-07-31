#!/bin/sh
curl $1 |awk -v head="playurl\":\"" -v tail="&from" '{print substr($0, index($0,head)+length(head),index($0,tail)-index($0,head)-length(head))}'|sed -n '/./p'  >>1.txt
curl $1 |awk -v head="play_name\">" -v tail="</h2>" '{print substr($0, index($0,head)+length(head),index($0,tail)-index($0,head)-length(head))}'|sed -n '/./p' >>2.txt
url=$(cat 1.txt)
name=$(cat 2.txt)
wget   -O "$name.m4a" $url
rm -f 1.txt 2.txt
