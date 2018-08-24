#!/bin/bash
clear
SENHA="132"
USER="Thales"
PASS="Thales"

criar(){
	for USUARIOS in $(cat usuarios.txt) ; do
		useradd -m -s /bin/bash $USUARIOS
		(echo $SENHA ; echo $SENHA) | passwd $USUARIOS
done
}

remover(){
	for USUARIOS in $(cat usuarios.txt) ; do
		userdel -r $USUARIOS
done
}

menu(){
  clear
  echo ; read -p "Digite o usuário: " USUARIO
  read -p "Digite a sua senha: " PASSWORD
  validacao
}

validacao(){
  [ $PASSWORD == $PASS ] && [ $USUARIO == $USER ] && remover || menu
}
menu
