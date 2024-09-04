# Conexión Inalámbrica

loadkeys en
iwctl
device list
station <NOMBRE_DISPOSITIVO> scan
station <NOMBRE_DISPOSITIVO> get-networks
station <NOMBRE_DISPOSITIVO> connect <NOMBRE_ROUTER>

########## En caso de ser una red privada ########## Los ejemplos utilizados son para la red de la Unison
# Crear en la carpeta /etc/iwd el archivo main.conf
cd /etc/iwd
vim main.conf
# Escribir 
[General]
EnableNetworkConfiguration=true
##########

# Crear en la carpeta /var/lib/iwd el archivo <Nombre de la red>.<Tipo de seguridad>
cd /var/lib/iwd
vim <nombre de la red>.<tipo de seguridad> (UniSon.8021x)
# Escribir 
[Security]
EAP-Method=<Metodo>(PEAP)
EAP-Identity=<user>
EAP-Password=<password>
CACert=/etc/ssl/certs/ca-certificates.crt
EAP-PEAP-Phase2-Method=<Metodo> (MSCHAPV2)

[Settings]
AutoConnect=true
##########

##########################################

exit
ping archlinux.org
timedatectl set-ntp true

# Crear y formatear particiones

lsblk
mkfs.ext4 /dev/<particion_raiz>
mkfs.ext4 /dev/<particion_secundaria>
mkswap /dev/<particion_swap>
swapon /dev/<particion_swap>
mount /dev/<particion_raiz> /mnt
mount --mkdir /dev/<particion_efi> /mnt/boot

# Instalar sistema

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

# Configurar sistema

arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime
hwclock --systohc
pacman -S vim
vim /etc/locale.gen  # Buscar en_US.UTF-8 UTF-8 y es_MX.UTF-8 UTF-8
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=en" > /etc/vconsole.conf
echo "<nombre_host>" > /etc/hostname
vim /etc/hosts

# Escribir en el archivo hosts
"
127.0.0.1   localhost
::1         localhost
127.0.1.1   FernyLinux.localhost FernyLinux
"

passwd
pacman -S networkmanager
systemctl enable NetworkManager
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/mnt/boot
pacman -S os-prober

# En el archivo /etc/default/grub descomenta:
"GRUB_DISABLE_OS_PROBER=false"

grub-mkconfig -o /boot/grub/grub.cfg
os-prober
update-grub
useradd -m <usuario>
passwd <usuario>
usermod -aG wheel,audio,video,storage <usuario>
pacman -S sudo

vim /etc/sudoers
# En el archivo "sudoers" busca:
"Uncomment to allow members of group wheel to execute any command"
# Y descomenta:
"#%wheel ALL=(ALL) ALL"

exit
umount -R /mnt
shutdown now

# Sacar USB y arrancar PC

# Conectarse a una red wifi con NetworkManager
nmcli device wifi list
sudo nmcli device wifi connect <nombre_red> password <password>
ping archlinux.org

# Clona el siguiente repositorio
sudo pacman -S git
git clone https://github.com/FernyBoy/arch-config.git

# Reemplaza el archivo "/etc/pacman.d/mirrorlist" por el que esta en el repositorio
sudo cp ./mirrorlist /etc/pacman.d/mirrorlist

# Instala
sudo pacman -S xorg xorg-server qtile lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm

# Instalación de YAY
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R <user>:<user> ./yay-git
cd yay-git
sudo pacman -S --needed git base-devel
makepkg -si

# Entra a "arch-config"
cd 'Auto installer'
chmod +x autoInstall.sh
bash autoInstall.sh ../Programs\ list/Programs.txt

# Entra a la carpeta "Themes - Icons"
# En: /Cursor
tar -xf Nordic-cursors.tar.xz
sudo mv Nordic-cursors /usr/share/icons
# En: /Icons
unzip BlackoutIcons.zip
sudo mv BlackoutIcons /usr/share/icons
# En: /Theme
tar -xf Fluent-round-dark.tar.xz
sudo mv Fluent-round-dark /usr/share/themes
# En: /Fonts
unzip JetBrainsMono.zip
sudo mv ./*.ttf /usr/share/fonts/TTF/
mkdir ~/.local/share/fonts
cp Monocraft.otf ~/.local/share/fonts/
# Realiza todos los cambios necesarios utilizando "lxappearance"

# Entra a la carpeta "Alacritty"
mkdir ~/.config/alacritty
cp alacritty.yml ~/.config/alacritty/

# Entra a la carpeta "Background"
mkdir ~/Images/Walls
cp 'Dark arch.png' ~/Images/Walls

# Entra a la carpeta "Bash config"
cp .bashrc ~/

# Entra a la carpeta "Grub"
Extract argon-grub-theme-3.2.2.tar.gz
mkdir ~/Docs/grub-config
mv argon-grub-theme-3.2.2 ~/Docs/grub-config
cd ~/Docs/grub-config/
sudo ./install.sh --install --resolution 1920x1080 --background ./backgrounds/1080p/grey.png --fontsize 32
