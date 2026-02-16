#!/bin/bash

# =============================== Manage Packages =============================== #

# Uninstall unnecessary apps -------------------------->
sudo dnf remove \
	abrt amd-{gpu,ucode}-firmware anaconda* baobab \
	cups system-config-printer-udev NetworkManager-bluetooth \
	gnome-{abrt,bluetooth,boxes,calendar,classic-session,connections,contacts}\
	gnome-{font-viewer,initial-setup,maps,tour,user-docs,weather} \
	fedora-{bookmarks,chromium-config} mediawriter \
	nano ntfs-3g ntfs-3g-libs {nvidia-gpu,nxpwireless}-firmware \
	libreoffice-core decibels showtime snapshot simple-scan \
	vpnc virtualbox-guest-additions yelp
	
sudo systemctl disable bluetooth.service


# Make dnf faster and update -------------------------->
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf update
# You may encounter problem with "open264" package for your ISP, So block it with
sudo tee -a /etc/dnf/dnf.conf <<EOF
max_parallel_downloads=10
install_weak_deps=False
EOF
# Change network provider and remove the line from dnf.conf for update the package

# Change hostname:
sudo hostnamectl set-hostname sirius


# Install required packages ------------------------------> 

# Neovim:
sudo dnf install nvim
ln -svf ~/Dotfiles/config/nvim ~/.config/ 

# Yazi:
sudo dnf copr enable lihaohong/yazi
sudo dnf install yazi --setopt=install_weak_deps=True
ln -svf ~/Dotfiles/config/yazi ~/.config/

# Zsh and Tools:
sudo dnf install fzf bat fastfetch zsh zsh-{syntax-highlighting,autosuggestions} lm_sensors
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dotfiles/config/zsh/.zshrc_sirius ~/.zshrc
mkdir ~/.config/fastfetch
ln -svf ~/Dotfiles/config/fastfetch/sirius.jsonc ~/.config/fastfetch/config.jsonc

# Audio and Video player:
sudo dnf install mpv g4music yt-dlp

# Setting rpmfusion repo:
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm \
	-E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-\
	nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
# Important for codecs
sudo dnf install ffmpeg --allowerasing

# Update xdg-directories:
ln -svf ~/Dotfiles/gconfig/xdg/user-dirs.dirs ~/.config/
rm -r Desktop Documents Templates Public 




# For Programming ------------------------------------------>
# Install C/C++ compiler and lsp:
sudo dnf install gcc gcc-c++ gdb clang-devel

# VS-Codium:
# Add repository for vscodium(https://vscodium.com/)
sudo dnf install codium
ln -svf ~/Dotfiles/gconfig/codium/settings.json ~/.config/VSCodium/User

# Chromium:
sudo dnf install chromium

# Node package:
sudo dnf install nodejs



# =============================== CUSTOMIZE GNOME =============================== #
# Delete shortcuts for switch to applications:
for i in {1..9}; do
    gsettings set org.gnome.shell.keybindings "switch-to-application-$i" "[]"
done

# Set shortcut for workspace change:
for i in {1..6}; do
    gsettings set org.gnome.desktop.wm.keybindings \
    "switch-to-workspace-$i" "['<Super>$i']"
done

# Set shortcut for application to move into a workspace:
for i in {1..6}; do
    gsettings set org.gnome.desktop.wm.keybindings \
    "move-to-workspace-$i" "['<Super><Shift>$i']"
done

# Set dynamic workspace false and number of workspace to 6:
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# Other window manager key customize:
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>Q']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>F']"
gsettings set org.gnome.settings-daemon.plugins.media-keys help "['', '<Alt>F10']"

# Install nerd fonts:
# sudo mv ~/Downloads/nerd-font-name /usr/share/fonts/
# sudo fc-cache -f

# Terminal(ptyxis) configurations:
gsettings set org.gnome.Ptyxis audible-bell false
gsettings set org.gnome.Ptyxis use-system-font false
gsettings set org.gnome.Ptyxis font-name 'CaskaydiaCove Nerd Font 10'
gsettings set org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/$(gsettings get \
org.gnome.Ptyxis default-profile-uuid | tr -d \')/ opacity 0.95


# Text-Editor configurations:
gsettings set org.gnome.TextEditor use-system-font false
gsettings set org.gnome.TextEditor custom-font 'CaskaydiaCove Nerd Font 11'
gsettings set org.gnome.TextEditor show-line-numbers true
gsettings set org.gnome.TextEditor tab-width 4
gsettings set org.gnome.TextEditor right-margin-position 88
gsettings set org.gnome.TextEditor show-right-margin true
gsettings set org.gnome.TextEditor spellcheck false
# For colorscheme, just drag and drop the custom colorscheme to 
# gnome-text-editor settings

# Nautilus configuration:
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'small-plus'
