#!/bin/bash

# Uninstall unused program:
sudo dnf remove \
    gnome-{boxes,calendar,contacts,connections,classic-session} \
    gnome-{initial-setup,logs,maps,tour,weather,shell-extension-background-logo} \
    libreoffice-core open-vpn vpnc fedora-chromium-config nano baobab mediawriter \
    totem rhythmbox anaconda-core anaconda-install-env-deps amd-gpu-firmware amd-ucode-firmware \
    abrt brlapi braille-printer-app snapshot ntfs-3g ntfs-3g-libs virtualbox-guest-additions \
    qemu-guest-agent nvidia-gpu-firmware yelp

# For fedora 43:
sudo dnf remove \
    showtime decibels papers

# If you enable third party repos during installation remove those:
sudo rm /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo
sudo rm /etc/yum.repos.d/google-chrome.repo
sudo rm /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo
sudo rm /etc/yum.repos.d/rpmfusion-nonfree-steam.repo

# To enable updating openh264 package:
sudo nano /etc/yum.repos.d/fedora-cisco-openh264.repo
# Under [fedora-cisco-openh264] change "enabled=1" to "enabled=0"

# Upgrade the system:
sudo dnf upgrade

# Install additional terminal:
sudo dnf install alacritty
ln -svf ~/Dotfiles/confs/alacritty ~/.config

# Install custom fonts:
sudo cp -r ~/Dotfiles/fonts/ /usr/share/fonts/
sudo fc-cache -fv
ln -svf ~/Dotfiles/confs/fontconfig ~/.config

# Install gnome extensions:
sudo dnf install gnome-extensions-app gnome-shell-extension-dash-to-dock

# Install yazi:
sudo dnf copr enable lihaohong/yazi
sudo dnf install yazi
ln -svf ~/Dotfiles/confs/yazi ~/.config

# Install nvim:
sudo dnf install neovim
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

# Install fzf and fastfetch and sensors:
sudo dnf install fzf fastfetch lm_sensors
ln -svf ~/Dotfiles/confs/fastfetch ~/.config

# Install z-shell:
sudo dnf install zsh zsh-{syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dotfiles/confs/zsh/zshrc ~/.zshrc
