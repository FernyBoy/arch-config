cd ./Cursor
tar -xf Nordic-cursors.tar.xz
sudo mv Nordic-cursors /usr/share/icons
cd ../

cd ./Icons
sudo mv BlackoutIcons /usr/share/icons
cd ../

cd ./Theme
tar -xf Fluent-round-dark.tar.xz
sudo mv Fluent-round-dark /usr/share/themes
cd ../

cd ./Fonts
sudo cp ./* /usr/share/fonts/
cd ../

cd ./Walls
mkdir -p /home/$USER/Images/Walls
cp ./* /home/$USER/Images/Walls
cd ../

sudo echo GRUB_THEME="/boot/grub/themes/minegrub-world-selection/theme.txt" >> /etc/default/grub
