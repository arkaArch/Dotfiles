#! /bin/bash
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
rm -rf yay


sudo pacman -S ttf-jetbrains-mono-nerd
yay visual-studio-code-bin
# Install Extensions
# C/C++ : Microsoft
# Gruvbox Material : sainnhe
# Material Icon Theme : Philipp Kief

# Link settings.json:
ln -svf ~/Dotfiles/Program-Configs/vscode/settings_v2.json ~/.config/Code/User/settings.json
