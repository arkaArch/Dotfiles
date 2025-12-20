#!/bin/bash

# Install Code-OSS:
sudo pacman -S code

# Install Extensions:
#   Clangd : llvm-vs-code-extensions
#   Everforest : sainnhe
#   Material Icon Theme : PKief

# Link settings.json:
ln -svf ~/Dotfiles/confs/code/settings.json ~/.config/Code\ -\ OSS/User  

