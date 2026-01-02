#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "Instalando assets del sistema..."

# ---------- Cursores ----------
echo "Instalando cursores..."
cd Cursor
tar -xf Nordic-cursors.tar.xz
sudo cp -r Nordic-cursors /usr/share/icons/
cd ..

# ---------- Iconos ----------
echo "Instalando iconos..."
cd Icons
sudo cp -r BlackoutIcons /usr/share/icons/
cd ..

# ---------- Temas ----------
echo "Instalando temas..."
cd Theme
tar -xf Fluent-round-dark.tar.xz
sudo cp -r Fluent-round-dark /usr/share/themes/
cd ..

# ---------- Fuentes ----------
echo "Instalando fuentes..."
FONT_DIR="/usr/share/fonts/custom"
sudo mkdir -p "$FONT_DIR"
sudo cp -r Fonts/* "$FONT_DIR/"

# ---------- Wallpapers ----------
echo "Instalando wallpapers..."
WALL_DIR="$HOME/Images/Walls"
mkdir -p "$WALL_DIR"
cp -r Walls/* "$WALL_DIR/"
betterlockscreen -u /home/$USER/Images/Walls/DarkOcean.png

echo "Assets instalados correctamente."
