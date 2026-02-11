#!/bin/sh

# Instal fonts:
sudo pacman -S noto-fonts{,-cjk,-emoji,-extra}
sudo pacman -S ttf-cascadia-code-nerd ttf-firacode-nerd

# Install Hyprland and it's components:
sudo pacman -S hyprland hyprpaper hyprlock htpridle rofi mako waybar wl-clipboard
ln -svf ~/Dotfiles/config/{hypr,rofi,mako,waybar} ~/.config

# Install terminals:
sudo pacman -S kitty ghostty
ln -svf ~/Dotfiles/config/{kitty,ghostty} ~/.config

# Browser:
sudo pacman -S firefox
# Extension: ublock-origin

# Installing sound and light:
sudo pacman -S pipewire pipewire-pulse sof-firmware brightnessctl

# Installing file-managers:
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick udisks2
ln -svf ~/Dotfiles/config/yazi ~/.config
sudo pacman -S thunar gvfs gvfs-mtp thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler ffmpegthumbnailer

# Installing z-shell and some gnu core-util alternatives:
sudo pacman -S bat eza
sudo pacman -S zsh zsh-{syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dotfiles/config/zsh/.zshrc_pollux ~/.zshrc
ln -svf ~/Dotfiles/config/zsh/.zprofile ~

# Linking nvim config:
ln -svf ~/Dotfiles/config/nvim/ ~/.config/

# Install image-viewer music and video player:
sudo pacman -S ristretto mpv mpd ncmpcpp
ln -svf ~/Dotfiles/config/{mpv,mpd,ncmpcpp} ~/.config
systemctl --user enable mpd
systemctl --user start mpd

# Installing cli utilities:
sudo pacman -S git openssh pacman-contrib fastfetch fwupd unzip
mkdir ~/.config/fastfetch
ln -svf ~/Dotfiles/config/fastfetch/pollux.jsonc ~/.config/fastfetch/config.jsonc

# GTK look and feel:
sudo pacman -S nwg-look materia-gtk-theme papirus-icon-theme

# Bluetooth:
sudo pacman -S bluez blueman
sudo systemctl enable bluetooth.service

# Install vulkan-intel(Don't know wheather its required or not)
sudo pacman -S vulkan-intel
