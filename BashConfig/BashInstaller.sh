#!/bin/bash

echo "Selecciona la configuración de Bash a instalar:"
echo "1) Configuración completa (Bash)"
echo "2) Configuración simple (SimpleBash)"
read -p "Opción [1-2] (Por defecto: 1): " choice

mkdir -p "$HOME/.config"
rm -rf "$HOME/.config/bash"

case "$choice" in
    2)
        echo "Copiando SimpleBash a $HOME/.config/bash..."
        cp -r ./SimpleBash "$HOME/.config/bash"
        ;;
    *)
        echo "Copiando configuración completa a $HOME/.config/bash..."
        cp -r ./Bash "$HOME/.config/bash"
        ;;
esac

cat .bash_loadfiles >> "$HOME/.bashrc"
echo "Configuración de Bash instalada correctamente."
