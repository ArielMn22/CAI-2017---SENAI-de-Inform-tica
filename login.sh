#!/bin/bash

usuario="Ariel"
senha="0ed5a4f0a1bed1b93113d77361b90b202cf85985e4f9d59ba4ff404a0100dc11"

criar(){
	CRIAUSU=$(	dialog					\
				--stdout				\
				--title "Criação de Usuário"\
				--inputbox "Digite o nome do usuário que deseja criar: "\
				0 0 )

	useradd -m -s /usr/bin/tcsh $CRIAUSU
	[[ $? == 0 ]] && $(passwd $CRIAUSU) ; CONT=$? || CONT=$?
	if [[ $CONT == 0 ]] ; then
			
			dialog						\
			--stdout					\
			--title "Status"			\
			--msgbox "Usuário criado com sucesso..."\
			0 0
	
	else
			dialog						\
			--stdout					\
			--title "ERRO!"				\
			--msgbox "Ocorreu um erro na criação do usuário..."\
			0 0		
		
		userdel -rf $CRIAUSER
	fi
	menu
	
}

remover(){

	REMOVER=$(	dialog 					\
				--stdout				\
				--title "Remover Usuário"\
				--inputbox "Qual o nome do usuário que deseja remover?"\
				0 0)
	
	userdel -rf $REMOVER
	CONT=$?
	if [[ $CONT == 0 ]] ; then
		
		dialog 						\
		--stdout					\
		--title "Status"			\
		--msgbox "Usuário removido com sucesso!"\
		0 0
	else
		dialog 						\
		--stdout 					\
		--title "Status"			\
		--msgbox "Ocorreu um erro na remoção do usuário"
	fi

	menu

}
opcao(){
	case $1 in
		"1"|"Criar") criar ;;
		"2"|"Remover")remover ;;
		"3"|"Sair") clear ; exit 0 ;;
		*) read -p "Opção inválida. \
				 Pressione [enter] para voltar ao menu." ;
				 menu ;;
	esac
}

menu(){
	OPCOES=$(	dialog                   \
				--stdout				 \
				--title "Gerenciador de Usuários"			 \
				--menu "Escolha uma opção: "				 \
				0 0 0                                        \
				"1"	"Cria Usuários"						 \
				"2" "Remove Usuários"					 \
				"3" 	"Fecha o programa"					 \
				)

	opcao $OPCOES
}

logar(){
	USER=$( dialog				\
			--stdout 			\
			--title "Usuário"	\
			--inputbox "Digite o nome do usuário: "\
			0 0)

	PASS=$(	dialog				\
			--stdout 			\
			--title "Senha"     \
			--passwordbox "Digite sua senha: " \
			0 0)

PASS=$(echo $PASS | sha256sum | cut -d" " -f1)
[[ $USER == $usuario ]] && [[ $PASS == $senha ]] && menu || logar
}
logar
