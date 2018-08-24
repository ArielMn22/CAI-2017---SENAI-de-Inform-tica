#!/bin/bash
clear
echo 'Qual o seu peso?'
read PESO
clear
echo 'Qual a sua altura?'
read ALTURA
clear
echo -n 'Seu IMC é: '
IMC=$(echo "scale=2;$PESO/($ALTURA*$ALTURA)"| bc)
echo $IMC

if [[ 18 > $IMC ]] ; then
	echo 'Abaixo do peso'
elif [[ 24 > $IMC ]] ; then
	echo 'Peso ideal (Parabéns)'
elif [[ 29 > $IMC ]] ; then
	echo 'Levemente acima do peso'
elif [[ 34 > $IMC ]] ; then
	echo 'Obesidade grau I'
elif [[ 39 > $IMC ]] ; then
	echo 'Obesidade II (severa)'
else
	echo 'Obesidade III (mórbido)'

fi
