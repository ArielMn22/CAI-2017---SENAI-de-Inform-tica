#!/bin/bash
clear
SENHA="132"
USER="Thales"
PASS="Thales"

read -p "Qual operação deseja realizar? Criar, ou remover usuários [C/R]?" OPERACAO

if [ $OPERACAO == "C" ] ; then
	OPERATION=criar
elif [ $OPERACAO == "R" ] ; then
	OPERATION=remover
else
	echo "Operação inválida"
fi
	
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
  [ $PASSWORD == $PASS ] && [ $USUARIO == $USER ] && $OPERATION || menu
}
menu
