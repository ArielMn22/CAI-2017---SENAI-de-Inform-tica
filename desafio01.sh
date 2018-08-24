#!/bin/bash
clear
echo 'Você é menino ou menina?'
read GENDER
clear
echo 'Você gosta de Linux?'
read GOSTO
if [ $GOSTO == 'sim' ] ; then
	if [ $GENDER == menino ] ; then
		echo 'Você é um cara muito legal!'
	else
		echo 'Você é uma moça muito legal!'
	fi
else
	if [ $GENDER == menino ] ; then
		echo 'Você tem que aprender muito'
	else
		echo 'Um dia você gostará'
	fi
fi
