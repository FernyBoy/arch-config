#!/bin/bash

# Verificamos si el usuario es root
if [ $(id -u) -ne 0 ]; then
	  echo "Este script debe ejecutarse como root."
	    exit 1
fi

# Verificamos si ya se ha instalado git
if ! pacman -Qi git &> /dev/null; then
	  # Si no se ha instalado git, lo instalamos
	    pacman -S git
fi

# Clonamos el repositorio de yay en el directorio temporal
cd $(mktemp -d)
git clone https://aur.archlinux.org/yay.git
cd yay

# Compilamos yay y luego lo instalamos
makepkg -si

