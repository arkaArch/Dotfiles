#!/bin/sh

# Install cosmic:
sudo pacman -S cosmic vulkan-intel power-profiles-daemon
sudo systemctl enable cosmic-greeter.service

# Instal fonts:
sudo pacman -S noto-fonts{,-cjk,-emoji,-extra} ttf-cascadia-code-nerd ttf-firacode-nerd

# Install ghostty:
sudo pacman -S ghostty
ln -svf ~/Dotfiles/config/ghostty ~/.config

# Browser:
sudo pacman -S firefox 
# Extension: ublock-origin

# Install yazi:
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick udisks2
ln -svf ~/Dotfiles/config/yazi ~/.config

# Installing z-shell and some gnu core-util alternatives:
sudo pacman -S bat exa
sudo pacman -S zsh zsh-{syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dotfiles/config/zsh/.zshrc ~

# Linking nvim config:
sudo pacman -S wl-clipboard
ln -svf ~/Dotfiles/config/nvim/ ~/.config/

# Install music and video player:
sudo pacman -S mpv mpd ncmpcpp
sudo pacman -Rns cosmic-player
ln -svf ~/Dotfiles/config/{mpd,ncmpcpp} ~/.config
systemctl --user enable mpd
systemctl --user start mpd

# Installing cli utilities:
sudo pacman -S git pacman-contrib tree fastfetch fwupd unzip
ln -svf ~/Dotfiles/config/fastfetch ~/.config
