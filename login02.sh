#!/bin/bash

entra()
{
	echo -e "\nVocê entrou"
	exit 0
}

sai()	
{
	echo -e "\nVocê saiu"
	sleep 1
}

login()
{
echo ; echo 'Debian GNU/Linux jessie tty1'

}
#Programa principal
ERRO=0
clear
login
while true; do
	while [ $ERRO -ge 5 ]; do
	clear ; login ; ERRO=0
	done	
		
	ERRO=$(($ERRO+1))
	echo ; read -p 'jessie login: ' LOGIN
	read -s -p 'Password: ' PASSW
	[ $LOGIN == 'vagrant' ] && [ $PASSW == '123' ] && entra || sai 
done
