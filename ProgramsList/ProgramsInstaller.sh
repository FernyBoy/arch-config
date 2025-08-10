#!/bin/bash

# --- Buenas prácticas ---
# Terminar el script si un comando falla o si se usa una variable no definida.
set -euo pipefail

# --- Constantes ---
readonly INPUT_FILE="$1"
readonly FAILED_PACKAGES_LOG="notInstalled.txt"

# --- Verificaciones Iniciales ---

# 1. Verificar que se proporcionó un archivo como argumento.
if [ $# -ne 1 ]; then
  echo "Uso: $0 <ruta/al/archivo/de/paquetes>"
  exit 1
fi

# 2. Verificar que el archivo de entrada existe.
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: El archivo '$INPUT_FILE' no fue encontrado."
  exit 1
fi

# 3. Verificar que 'yay' está instalado.
if ! command -v yay &> /dev/null; then
  echo "Error: 'yay' no está instalado. Por favor, instálalo para continuar."
  exit 1
fi

# 4. Prevenir la ejecución como root (yay no lo permite).
if [ "$EUID" -eq 0 ]; then
  echo "Error: No ejecutes este script como root o con sudo. 'yay' pedirá la contraseña cuando sea necesario."
  exit 1
fi

# --- Lógica Principal ---

# Creamos dos arrays: uno para los paquetes a instalar y otro para los que fallen.
mapfile -t packages_to_install < <(awk '{print $1}' "$INPUT_FILE" | grep -vE '^\s*$|^#')
failed_packages=()

echo "Se intentarán instalar los siguientes paquetes:"
printf " - %s\n" "${packages_to_install[@]}"
echo "--------------------------------------------------"

# Usamos 'yay' para instalar todos los paquetes en una sola transacción.
# --noconfirm para evitar preguntas.
# --needed para no reinstalar paquetes que ya están actualizados.
if ! yay -S --noconfirm --needed "${packages_to_install[@]}"; then
    echo "--------------------------------------------------"
    echo "Algunos paquetes no se pudieron instalar. Verificando cuáles..."

    # Si la instalación en bloque falla, intentamos uno por uno para identificar los problemáticos.
    for pkg in "${packages_to_install[@]}"; do
        if ! yay -S --noconfirm --needed "$pkg"; then
            echo "FALLÓ: $pkg"
            failed_packages+=("$pkg")
        fi
    done
fi

# --- Reporte Final ---

if [ ${#failed_packages[@]} -gt 0 ]; then
    echo "--------------------------------------------------"
    echo "La instalación ha finalizado con errores."
    echo "Los siguientes paquetes no se pudieron instalar y se han guardado en '$FAILED_PACKAGES_LOG':"
    # Guardamos los paquetes fallidos en el archivo de log.
    printf "%s\n" "${failed_packages[@]}" | tee "$FAILED_PACKAGES_LOG"
else
    echo "--------------------------------------------------"
    echo "¡Éxito! Todos los paquetes fueron instalados correctamente."
fi

