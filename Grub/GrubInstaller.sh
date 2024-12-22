tar -xf argon-grub-theme-3.2.2.tar.gz
mkdir -p /home/$USER/Docs/grub-config
cd ./argon-grub-theme-3.2.2
./install.sh --install --resolution 1920x1080 --background Night --fontsize 16
cd ../
mv argon-grub-theme-3.2.2 /home/$USER/Docs/grub-config/
