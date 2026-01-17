#!/bin/sh

# Instal fonts:
sudo pacman -S noto-fonts{,-cjk,-emoji,-extra}
sudo pacman -S ttf-cascadia-code-nerd ttf-firacode-nerd

# Install Hyprland and it's components:
sudo pacman -S hyprland kitty hyprpaper hyprlock htpridle rofi mako waybar wl-clipboard
ln -svf ~/Dotfiles/confs/{hypr,kitty,rofi,mako,waybar} ~/.config

# Browser:
sudo pacman -S firefox 
# Extension: ublock-origin

# Installing sound and audio:
sudo pacman -S pipewire pipewire-pulse sof-firmware brightnessctl

# Installing file-managers:
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick udisks2
ln -svf ~/Dotfiles/confs/yazi ~/.config
sudo pacman -S thunar gvfs gvfs-mtp thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler ffmpegthumbnailer

# Installing z-shell and exa:
sudo pacman -S exa zsh zsh-{syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dotfiles/confs/zsh/zshrc ~/.zshrc

# Linking nvim config:
ln -svf ~/Dotfiles/confs/nvim/ ~/.config/

# Install image-viewer music and video player:
sudo pacman -S ristretto mpv mpd ncmpcpp
ln -svf ~/Dotfiles/confs/{mpv,mpd,ncmpcpp} ~/.config
systemctl --user enable mpd
systemctl --user start mpd

# Installing cli utilities:
sudo pacman -S git openssh pacman-contrib tree fastfetch fwupd unzip
ln -svf ~/Dotfiles/confs/fastfetch ~/.config

# GTK look and feel:
sudo pacman -S nwg-look materia-gtk-theme papirus-icon-theme

# Bluetooth:
sudo pacman -S bluez blueman
sudo systemctl enable bluetooth.service

# Install vulkan-intel(Don't know wheather its required or not)
sudo pacman -S vulkan-intel
