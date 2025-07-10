#!/bin/bash

# Upgrade the system:
sudo dnf upgrade

# Install required packages
sudo dnf install git fzf fastfetch

# Install custom fonts:
sudo cp -r ~/Dotfiles/fonts/ /usr/share/fonts/
sudo fc-cache -fv
ln -svf ~/Dotfiles/confs/fontconfig ~/.config

# Install yazi:
sudo dnf copr enable lihaohong/yazi
sudo dnf install yazi
ln -svf ~/Dotfiles/confs/yazi ~/.config

# Install nvim:
sudo dnf install nvim
ln -svf ~/Dotfiles/confs/nvim ~/.config

# Install music and video programs:
# Enbale rpm fusion:
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Replace ffmpeg-free with ffmpeg(RPM):
sudo dnf install ffmpeg --allowerasing

# Install mpv, mpd and ncmpcpp:
sudo dnf install mpv mpd ncmpcpp
ln -svf ~/Dotfiles/confs/{mpd,ncmpcpp} ~/.config
systemctl --user enable mpd
systemctl --user start mpd

# Install z-shell:
sudo dnf install zsh zsh-{syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dotfiles/confs/zsh/zshrc ~/.zshrc


# Uninstall unused program:
sudo dnf remove \
    amd-gpu-firmware amd-ucode-firmware nvidia-gpu-firmware anaconda-core \
    anaconda-install-env-deps mediawriter nano abrt brlapi braille-printer-app \
    libreoffice-core thunderbird nheko cosmic-player rhythmbox vlc-libs \
    virtualbox-guest-additions qemu-guest-agent ntfs-3g ntfs-3g-libs
    

