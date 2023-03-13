# Conexión Inalámbrica

loadkeys en
iwctl
device list
station <NOMBRE_DISPOSITIVO> scan
station <NOMBRE_DISPOSITIVO> get-networks
station <NOMBRE_DISPOSITIVO> connect <NOMBRE_ROUTER>
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
mkdir /mnt/home
mount /dev/<particion_secundaria> /mnt/home
mkdir /mnt/boot
mount /dev/<particion_efi> /mnt/boot

# Instalar sistema

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

# Configurar sistema

arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime
hwclock --systohc
pacman -S vim
vim /etc/locale.gen  # Buscar en_US.UTF-8 UTF-8 y es_ES.UTF-8 UTF-8
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=en" > /etc/vconsole.conf
echo "<nombre_host>" > /etc/hostname
vim /etc/hosts

# Escribir en el archivo hosts
{
    127.0.0.1   localhost
    ::1         localhost
    127.0.1.1   FernyLinux.localhost FernyLinux
}

passwd
pacman -S networkmanager
systemctl enable NetworkManager
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot
pacman -S os-prober
{
    En: /etc/default/grub
    Descomentar: GRUB_DISABLE_OS_PROBER=false
}
grub-mkconfig -o /boot/grub/grub.cfg
os-prober
update-grub
useradd -m <usuario>
passwd <usuario>
usermod -aG wheel,audio,video,storage <usuario>
pacman -S sudo
vim /etc/sudoers
exit
umount -R /mnt
shutdown now

# Sacar USB y arrancar PC

# Instalar Entorno de Escritorio KDE-Plasma

sudo nmcli device wifi connect NOMBRE password CONTRASEÑA
ping archlinux.org
sudo pacman -S xorg
sudo pacman -S git
sudo pacman -S --needed base-devel
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R user:user ./yay-git
cd yay-git
makepgk -si
