#!/bin/bash
clear

for USUARIO in $(cat usuarios.txt) ; do
	userdel $USUARIO
	rm -rf /home/$USUARIO
done
