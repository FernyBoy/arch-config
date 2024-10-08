cd /opt
sudo git clone https://aur.archlinux.org/yay-git
sudo chown -R $USER:$USER ./yay-git
cd yay-git
sudo pacman -S --needed git base-devel
makepkg -si
