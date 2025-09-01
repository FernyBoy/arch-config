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

sudo cp Fonts/*.ttf /usr/share/fonts/
sudo cp Fonts/*.otf /usr/share/fonts/

mkdir -p /home/$USER/Images/Walls
cp /*.png /home/$USER/Images/Walls


echo GRUB_THEME="/boot/grub/themes/minegrub-world-selection/theme.txt" >> /etc/default/grub
