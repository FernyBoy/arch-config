cd ./Cursor
tar -xf Nordic-cursors.tar.xz
sudo mv Nordic-cursors /usr/share/icons
cd ../

cd ./Icons
unzip BlackoutIcons.zip
sudo mv BlackoutIcons /usr/share/icons
cd ../

cd ./Theme
tar -xf Fluent-round-dark.tar.xz
sudo mv Fluent-round-dark /usr/share/themes
cd ../

sudo cp Fonts/*.ttf /usr/share/fonts/
sudo cp Fonts/*.otf /usr/share/fonts/

mkdir -p /home/$USER/Images
cp -r Walls /home/$USER/Images
