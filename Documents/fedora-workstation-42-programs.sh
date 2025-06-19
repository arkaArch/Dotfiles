#!/bin/env/bash

# Uninstall unused program:
sudo dnf remove \
    gnome-{boxes,calendar,contacts,connections,classic-session} \
    gnome-{initial-setup,logs,maps,tour,weather,shell-extension-background-logo} \
    libreoffice-core open-vpn vpnc fedora-chromium-config nano baobab mediawriter \
    totem rhythmbox anaconda-core anaconda-install-env-deps amd-gpu-firmware amd-ucode-firmware \
    abrt brlapi braille-printer-app snapshot ntfs-3g virtualbox-guest-additions qemu-guest-agent

# If you enable third party repos during installation remove those:
sudo rm /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo
sudo rm /etc/yum.repos.d/google-chrome.repo
sudo rm /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo
sudo rm /etc/yum.repos.d/rpmfusion-nonfree-steam.repo

# Upgrade the system:
sudo dnf upgrade

# Install custom fonts:
sudo cp -r ~/Dotfiles/Custom-Fonts/ /usr/share/fonts/
sudo fc-cache -fv
ln -svf ~/Dotfiles/Program-Configs/fontconfig ~/.config

# Install gnome extensions:
sudo dnf install gnome-extensions-app gnome-shell-extension-dash-to-dock

# Install yazi:
sudo dnf copr enable lihaohong/yazi
sudo dnf install yazi
ln -svf ~/Dotfiles/Program-Configs/yazi ~/.config

# Install nvim:
sudo dnf install nvim
ln -svf ~/Dotfiles/Program-Configs/nvim ~/.config

# Install music and video programs:
# Enbale rpm fusion:
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Replace ffmpeg-free with ffmpeg(RPM):
sudo dnf install ffmpeg --allowerasing

# Install mpv, mpd and ncmpcpp:
sudo dnf install mpv mpd ncmpcpp
ln -svf ~/Dotfiles/Program-Configs/{mpd,ncmpcpp} ~/.config
systemctl --user enable mpd
systemctl --user start mpd

# Install kitty, fzf ans fastfetch:
sudo dnf install kitty fzf fastfetch
ln -svf ~/Dotfiles/Program-Configs/{kitty,fastfetch} ~/.config

# Install z-shell:
sudo dnf install zsh zsh-{syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dotfiles/Program-Configs/zsh/zsh_fedora ~/.zshrc

# Install programs for development:
sudo dnf install gcc-c++ gdb  java-21-openjdk-devel

# Install vscode:
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code
# Install Extensions
# C/C++ : Microsoft
# Everforest : sainnhe
# Material Icon Theme : Philipp Kief
# Language Support for Java(TM) by Red Hat : Red Hat
# Link settings.json:
ln -svf ~/Dotfiles/Program-Configs/vscode/settings.json ~/.config/Code/User
