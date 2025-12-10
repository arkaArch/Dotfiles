#!/bin/sh

# Installing cli utilities:
sudo pacman -S git openssh pacman-contrib tree fastfetch

# Instal fonts:
sudo pacman -S noto-fonts{,-cjk,-emoji,-extra}
sudo pacman -S ttf-cascadia-code-nerd

# Install Hyprland and it's components:
sudo pacman -S hyprland kitty hyprpaper rofi waybar swaync wl-clipboard
ln -svf ~/Dotfiles/confs/{hypr,kitty,rofi} ~/.config

# Browser:
sudo pacman -S firefox 
# Extension: ublock-origin

# Installing sound drivers:
sudo pacman -S pipewire pipewire-pulse

# Installing file-managers:
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick udisks2
ln -svf ~/Dotfiles/confs/yazi ~/.config
sudo pacman -S thunar gvfs thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler ffmpegthumbnailer

# Installing z-shell and exa:
sudo pacman -S zsh zsh-{syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dotfiles/confs/zsh/zshrc_arch ~/.zshrc

# Linking nvim config:
ln -svf ~/Dotfiles/confs/nvim/ ~/.config/

# Install mpv, mpd and ncmpcpp:
sudo pacman -S mpv mpd ncmpcpp
ln -svf ~/Dotfiles/confs/{mpd,ncmpcpp} ~/.config
systemctl --user enable mpd
systemctl --user start mpd
