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
