#!/bin/bash

echo "[+] Installing packages"
sudo pacman -S polybar feh python-pywal picom rofi dunst ly alacritty xsessions xauth zig pam xorg xorg-xauth brightnessctl nemo

echo "\n[+] cloning the config repo"
cd /opt && sudo git clone https://github.com/5epi0l/ArchLinux-i3-config.git

echo "\n[+] Downloading Hack Nerd Font"
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip" -O ~/Downloads/Hack.zip && sudo unzip ~/Downloads/Hack.zip -d /usr/share/fonts/TTF/

echo "\n[+] Setting up Wallpapers"
mkdir ~/Pictures/Wallpapers && wget "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/mountains.png" -O ~/Pictures/Wallpapers/manga.png

echo "\n[+] Setting up"
cp /opt/ArchLinux-i3-config/config ~/.config/i3/
mkdir ~/.config/alacritty && cp /opt/ArchLinux-i3-config/alacritty.toml ~/.config/alacritty/
mkdir ~/.config/picom && cp /opt/ArchLinux-i3-config/picom.conf ~/.config/picom/
mkdir ~/.config/polybar && cp /opt/ArchLinux-i3-config/config.polybar.ini ~/.config/polybar/config.ini

cp /opt/ArchLinux-i3-config/launch.sh ~/.config/polybar/ && chmod +x ~/.config/polybar/launch.sh

sudo cp /opt/ArchLinux-i3-config/config.ini /etc/ly/

sudo systemctl disable lightdm && sudo systemctl enable ly

echo "\n[+] rebooting"
reboot

