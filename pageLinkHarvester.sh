#!/bin/bash

if [ "$1" == "" ]
then
        echo "Modo de Usar: $0 site.com.br"
else

curl $1 | grep href | cut -d "/" -f 3 | grep "\." | cut -d "\"" -f 1 | grep -v "<l" 1>$1.txt

echo
echo -e "\e[01;34m============================================================\e[0m"
echo
echo -e "\tResolvendo URLS em: $1"
echo
echo -e "\e[01;31m============================================================\e[0m"

for url in $(cat $1.txt); do
    host $url | grep "has address" | sed 's/has address/\t\t/'
done
fi

echo -e "\e[1;31m============================================================\e[0m"

rm $1.txt
