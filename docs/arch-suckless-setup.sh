#!/bin/bash

# This script is an add on installation having hyprland on my system.

# Install required xorg-packages 
sudo pacman -S xorg-server xorg-xinit

# Install suckless-softwares:
suckless_dir="$HOME/Dotfiles/suckless"
cd $suckless_dir 2> /dev/null || { echo "Can't find $suckless_dir"; exit 1; }
for dir in */; do
    cd $dir
    sudo make clean install
    cd ..
done
echo -e "\033[31mSUCKLESS TOOLS ARE INSTALLED SUCCESSFULLY.\033[0m"
