#!/bin/sh

# Install cosmic:
sudo pacman -S cosmic power-profiles-daemon

# Instal fonts:
sudo pacman -S noto-fonts{,-cjk,-emoji,-extra} ttf-cascadia-code-nerd ttf-firacode-nerd

# Install ghostty:
sudo pacman -S ghostty
ln -svf ~/Dotfiles/config/ghostty ~/.config

# Browser:
sudo pacman -S firefox 
# Extension: ublock-origin

# Pipewire:
sudo pacman -S pipewire pipewire-pulse

# Install yazi:
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick udisks2
ln -svf ~/Dotfiles/config/yazi ~/.config

# Installing z-shell and some gnu core-util alternatives:
sudo pacman -S bat exa
sudo pacman -S zsh zsh-{syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dotfiles/config/zsh/zshrc ~/.zshrc

# Linking nvim config:
ln -svf ~/Dotfiles/config/nvim/ ~/.config/

# Install music and video player:
sudo pacman -S mpv mpd ncmpcpp
ln -svf ~/Dotfiles/config/{mpd,ncmpcpp} ~/.config
systemctl --user enable mpd
systemctl --user start mpd

# Installing cli utilities:
sudo pacman -S git openssh pacman-contrib tree fastfetch fwupd unzip
ln -svf ~/Dotfiles/config/fastfetch ~/.config

# Install vulkan-intel(Don't know wheather its required or not)
sudo pacman -S vulkan-intel
