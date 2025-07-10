#!/bin/bash

# Install programs for development:
sudo dnf install gcc-c++ gdb clangd

# Install racket
sudo dnf install racket

# Install vscodium:
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=0\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h\n" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium
# Install Extensions
#   Clangd : llvm-vs-code-extensions
#   Everforest : sainnhe
#   Material Icon Theme : PKief

# Link settings.json:
ln -svf ~/Dotfiles/confs/codium/settings.json ~/.config/VSCodium/User
