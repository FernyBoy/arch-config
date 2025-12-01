# Alacritty installer
cd ./Alacritty
./AlacrittyInstaller.sh
cd ../

# Assets installer
cd ./Assets
./AssetsInstaller.sh
cd ../

# Autokey installer
cd ./Autokey
./AutokeyInstaller.sh
cd ../

# Bash installer
cd ./BashConfig
./BashInstaller.sh
cd ../

# Mirrors installer
cd ./Mirrors
./MirrorsInstaller.sh
cd ../

# Picom installer
cd ./Picom
./PicomInstaller.sh
cd ../

# Programs installer
cd ./ProgramsList
./ProgramsInstaller.sh Programs.txt
cd ../

# Qtile installer
cd ./QtileConfig
./QtileInstaller.sh
cd ../

# Rofi theme installer
cd ./Rofi
./RofiThemeInstaller.sh
cd ../

# SDDM installer
cd ./SDDM
./InstallSddmTheme.sh
cd ../

# Neovim config
git clone https://github.com/FernyBoy/nvim-config.git /home/$USER/.config/nvim

# XProfile installer
cd ./XProfile
./XProfileInstaller.sh
cd ../
