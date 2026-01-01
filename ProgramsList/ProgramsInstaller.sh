#!/bin/bash

# --------------------------------------------------
# ProgramsInstaller.sh
# --------------------------------------------------

set -euo pipefail

# --- Constantes ---
readonly INPUT_FILE="./programs_list"
readonly FAILED_PACKAGES_LOG="notInstalled"

# --- Verificaciones iniciales ---

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: El archivo '$INPUT_FILE' no fue encontrado."
    exit 1
fi

if ! command -v yay &> /dev/null; then
    echo "Error: 'yay' no está instalado."
    exit 1
fi

if [ "$EUID" -eq 0 ]; then
    echo "Error: No ejecutes este script como root."
    exit 1
fi

# --- Leer paquetes ---
mapfile -t packages < <(awk '{print $1}' "$INPUT_FILE" | grep -vE '^\s*$|^#')

if [ "${#packages[@]}" -eq 0 ]; then
    echo "No hay paquetes para instalar."
    exit 0
fi

# --- Selección de modo de instalación ---

echo "--------------------------------------------------"
echo "Modo de instalación:"
echo "  1) Preguntar confirmación durante la instalación"
echo "  2) Instalar todo sin confirmaciones"
echo "--------------------------------------------------"

while true; do
    read -rp "Selecciona una opción [1/2]: " mode
    case "$mode" in
        1)
            YAY_FLAGS="--needed"
            break
            ;;
        2)
            YAY_FLAGS="--needed --noconfirm"
            break
            ;;
        *)
            echo "Opción inválida."
            ;;
    esac
done

# --- Progreso ---
total=${#packages[@]}
current=0
failed_packages=()

draw_progress() {
    local progress=$1
    local total=$2
    local width=40
    local filled=$(( progress * width / total ))
    local empty=$(( width - filled ))

    printf "\r["
    printf "%0.s#" $(seq 1 "$filled")
    printf "%0.s-" $(seq 1 "$empty")
    printf "] %d/%d" "$progress" "$total"
}

echo "--------------------------------------------------"
echo "Iniciando instalación de $total paquetes"
echo "--------------------------------------------------"

# --- Instalación paquete por paquete ---

for pkg in "${packages[@]}"; do
    current=$((current + 1))
    draw_progress "$current" "$total"
    echo; echo; echo; echo
    echo "Instalando: $pkg"
    echo "--------------------------------------------------"

    if ! yay -S $YAY_FLAGS "$pkg"; then
        echo "FALLÓ: $pkg"
        failed_packages+=("$pkg")
    fi
done

echo
echo "--------------------------------------------------"

# --- Reporte final ---

if [ "${#failed_packages[@]}" -gt 0 ]; then
    echo "Instalación finalizada con errores."
    echo "Paquetes no instalados:"
    printf "%s\n" "${failed_packages[@]}" | tee "$FAILED_PACKAGES_LOG"
else
    echo "¡Instalación completada exitosamente!"
fi
