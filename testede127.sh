#!/bin/bash
clear

ping 8.8.8.8 ; VALIDACAO=$?

[ $VALIDACAO != 0 ] && echo "Deu ruim!!" || echo "Deu certo!!"

