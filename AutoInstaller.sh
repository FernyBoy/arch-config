#!/bin/bash

# ----------------------------------------------------------
# AutoInstaller.sh
#
# Orquestador principal de la configuración del sistema Arch.
#
# Supuestos:
# - Sistema Arch recién instalado
# - Usuario normal activo
# - yay ya instalado
# - Ejecución intencional y consciente
#
# Este script NO:
# - Pide confirmaciones
# - Maneja errores complejos
# - Soporta instalaciones parciales
# ----------------------------------------------------------

set -e

BASE_DIR="$(pwd)"

run_module()
{
    local module_path="$1"
    local installer="$2"
    local description="$3"

    echo
    echo "=================================================="
    echo ">> ${description}"
    echo "=================================================="

    cd "${BASE_DIR}/${module_path}"
    ./"${installer}"
    cd "${BASE_DIR}"
}



# ----------------------------------------------------------
# Paquetes base y servicios
# ----------------------------------------------------------
run_module "ProgramsList" "ProgramsInstaller.sh" "Instalando programas base y AUR"

echo
echo "Habilitando servicios del sistema"
sudo systemctl enable sddm
sudo systemctl --user enable --now pipewire.service pipewire.socket wireplumber.service



# ----------------------------------------------------------
# Terminal
# ----------------------------------------------------------
run_module "Alacritty" "AlacrittyInstaller.sh" "Instalando terminal (Alacritty)"



# ----------------------------------------------------------
# Assets visuales (fuentes, iconos, cursores, temas, wallpapers)
# ----------------------------------------------------------
run_module "Assets" "AssetsInstaller.sh" "Instalando assets visuales"



# ----------------------------------------------------------
# Automatización de teclado
# ----------------------------------------------------------
run_module "Autokey" "AutokeyInstaller.sh" "Instalando AutoKey"



# ----------------------------------------------------------
# Shell (Bash)
# ----------------------------------------------------------
run_module "BashConfig" "BashInstaller.sh" "Configurando Bash"



# ----------------------------------------------------------
# Audio (PipeWire + EasyEffects)
# ----------------------------------------------------------
run_module "EasyEffects-Presets" "install.sh" "Configurando audio y presets de EasyEffects"



# ----------------------------------------------------------
# Mirrors
# ----------------------------------------------------------
run_module "Mirrors" "MirrorsInstaller.sh" "Configurando mirrors de pacman"



# ----------------------------------------------------------
# Compositor
# ----------------------------------------------------------
run_module "Picom" "PicomInstaller.sh" "Instalando y configurando Picom"



# ----------------------------------------------------------
# Window Manager
# ----------------------------------------------------------
run_module "QtileConfig" "QtileInstaller.sh" "Configurando Qtile"



# ----------------------------------------------------------
# Launcher
# ----------------------------------------------------------
run_module "Rofi" "RofiThemeInstaller.sh" "Instalando tema de Rofi"



# ----------------------------------------------------------
# Display Manager
# ----------------------------------------------------------
run_module "SDDM" "InstallSddmTheme.sh" "Instalando y configurando SDDM"



# ----------------------------------------------------------
# Neovim
# ----------------------------------------------------------
echo
echo "=================================================="
echo ">> Instalando configuración de Neovim"
echo "=================================================="

git clone https://github.com/FernyBoy/nvim-config.git /home/$USER/.config/nvim



# ----------------------------------------------------------
# Variables de entorno X11
# ----------------------------------------------------------
run_module "XProfile" "XProfileInstaller.sh" "Configurando XProfile"



echo
echo "=================================================="
echo ">> Instalación finalizada"
echo "=================================================="
echo "Reinicia el sistema para aplicar todos los cambios"
