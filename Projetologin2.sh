#!/bin/bash

USER="Ariel";PASS="6a09e45514dfa07d8ae488803cec64f5f6b139e792ae369cb96ce1f59df12068"

criar(){ 
read -p "Codigo 'criar' executando" ; menu
}

remover(){ 
read -p "Codigo 'remover' executando" ; menu
}

sair(){ exit 0 ; }

menu(){
	clear
	echo "Criar - Criar Usuários"
	echo "Remover - Remover Usuários"
	echo "Sair - Sair do programa"
	echo "--------------------"
	read -p "Escolha uma opção: " OPCAO
	OPCAO=$(echo $OPCAO | tr A-Z a-z)
	case $OPCAO in
	"criar") criar ;;
	"remover") remover ;;
	"sair") sair ;;
	*) clear
	   read -p "Opção inválida. Pressione [ENTER] para sair"
	   menu;;
	esac
}

logar(){
	clear
	echo
	read -p "Login: " LOGIN
	read -s -p "Password: " PASSWORD
	PASSWORD=$(echo $PASSWORD | sha256sum | cut -d" " -f1)
	[ $LOGIN == $USER ] && [ $PASSWORD == $PASS ] && menu || logar
}

logar
