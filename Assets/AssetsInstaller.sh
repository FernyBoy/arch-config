cd ./Cursor
tar -xf Nordic-cursors.tar.xz
sudo cp Nordic-cursors /usr/share/icons
cd ../

cd ./Icons
sudo cp BlackoutIcons /usr/share/icons
cd ../

cd ./Theme
tar -xf Fluent-round-dark.tar.xz
sudo cp Fluent-round-dark /usr/share/themes
cd ../

cd ./Fonts
sudo cp ./* /usr/share/fonts/
cd ../

cd ./Walls
mkdir -p /home/$USER/Images/Walls
cp ./* /home/$USER/Images/Walls
cd ../
