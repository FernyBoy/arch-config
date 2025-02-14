tar -xf argon-grub-theme-3.2.2.tar.gz
mkdir -p /home/$USER/Programs/Argon
cd ./argon-grub-theme-3.2.2
sudo ./install.sh --install --resolution 1920x1080 --background Night --fontsize 16
sudo ./install.sh -i -b /home/$USER/Images/Walls/LofiHouse.png
cd ../
mv argon-grub-theme-3.2.2 /home/$USER/Programs/Argon
