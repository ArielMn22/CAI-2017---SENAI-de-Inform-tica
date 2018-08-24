#!/bin/bash

usuario="Ariel"
senha="0ed5a4f0a1bed1b93113d77361b90b202cf85985e4f9d59ba4ff404a0100dc11"

CRIAR(){
	
	clear ; read -p "Digite o nome do usuário a ser criado: " CRIAUSER
	read -p "Com qual SHELL você deseja que seu usuário seja executado? "\
 	SHELL
	SHELL=$(echo $SHELL | tr A-Z a-z)
	useradd -m -s /bin/$SHELL $CRIAUSER
	
	CHECKSHELL=$?
	[ $CHECKSHELL != 0 ] && echo "Algo deu errado!" && CRIAR
	
	passwd $CRIAUSER
	
	read -p "Pressione [ENTER] para finalizar."
}

REMOVER(){
	read -p "Digite o nome do usuário que deseja remover: " RM
	userdel -r $RM
	if [ $? != 0 ]
	then
		read -p "Falhou" ; menu
	fi
	read -p "Pressione [ENTER] para finalizar."
 }

menu(){
	clear ; echo "1) Criar usuários"
	echo "2) Remover Usuários"
	echo "3) Sair"
	read -p "Escolha uma opção: " OPCAO
	case $OPCAO in
	1) CRIAR ;;
	2) REMOVER ;;
	3) exit 0 ;;
	*) read -p "Opção inválida. \
Pressione [ENTER] para continuar." ; menu ;;
	esac
}

logar(){
	clear
	echo
	read -p "Usuário: " USER
	read -s -p "Senha: " PASS
	PASS=$(echo $PASS | sha256sum | cut -d" " -f1)
	[ $USER == $usuario ] && [ $PASS == $senha ] && menu || logar
}
logar
