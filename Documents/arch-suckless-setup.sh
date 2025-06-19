#! /bin/sh

# Start the script from home:
cd $HOME
mkdir ~/.config


# Install required drivers for intel intel gpu:
sudo pacman -S mesa intel-media-driver


# Fonts:
sudo pacman -S noto-fonts-{cjk,emoji,extra}
sudo pacman -S ttf-cascadia-code-nerd
ln -svf ~/Dotfiles/Program-Configs/fontconfig ~/.config


# Install required xorg packages and an extra terminal:
sudo pacman -S xorg xorg-xinit xwallpaper alacritty
ln -svf ~/Dotfiles/Program-Configs/alacritty ~/.config


# Install required headers for make suckless tools
sudo pacman -S imlib2

# Install suckless programs:
cd ~/Dotfiles/Suckless/
tools=("dwm" "st" "dmenu" "dwmblocks" "slock")
for tool in ${tools[@]}; do
    cd $tool
    sudo make clean install
    cd ..
done
cd $HOME


# Sound and brightness:
sudo pacman -S pipewire pipewire-audio pipewire-pulse pamixer


# File manager:
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick unzip \
    unrar udisks2 xclip ueberzugpp
sudo pacman -S thunar catfish gvfs tumbler thunar-volman thunar-archive-plugin \
    thunar-media-tags-plugin file-roller poppler-glib gvfs-mtp ffmpegthumbnailer
ln -svf ~/Dotfiles/Program-Configs/yazi/ ~/.config/


# Music and video programs:
sudo pacman -S mpd ncmpcpp mpv yt-dlp
ln -svf ~/Dotfiles/Program-Configs/{mpd,ncmpcpp} ~/.config
systemctl --user enable mpd
systemctl --user start mpd


# Notification:
sudo pacman -S libnotify dunst
mkdir -p ~/.local/share
cp -r ~/Dotfiles/Icons/notify-icons ~/.local/share
ln -svf ~/Dotfiles/Program-Configs/dunst ~/.config


# Browser:
sudo pacman -S firefox  # Extension: ublock-origin


# Z-Shell with color prompt:
sudo pacman -S exa
sudo pacman -S zsh zsh-{completions,syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dotfiles/Program-Configs/zsh/zsh_arch ~/.zshrc


# Cli tools, firmware-updaters:
sudo pacman -S pacman-contrib tree git openssh fwupd


# Link neovim setup:
ln -svf ~/Dotfiles/Program-Configs/nvim ~/.config


# Look and feel:
sudo pacman -S lxappearance-gtk3
mkdir ~/{.themes,.icons}
tar -xzf ~/Dotfiles/Themes/everforest-dark-bordered.tar.gz -C ~/.themes
mkdir ~/.config/gtk-3.0
ln -svf ~/Dotfiles/Themes/dwm.css ~/.config/gtk-3.0/gtk.css
unzip ~/Dotfiles/Icons/themes/everforest-dark-icons.zip -d ~/.icons
tar -xzf ~/Dotfiles/Icons/themes/nordzy-cursors.tar.gz -C ~/.icons


# Link .xintrc
ln -svf ~/Dotfiles/Program-Configs/xorg/.xinitrc ~
