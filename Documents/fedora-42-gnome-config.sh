#!/bin/bash

# Set gnome-text-editor:
gsettings set org.gnome.TextEditor tab-width 4
gsettings set org.gnome.TextEditor spellcheck false
gsettings set org.gnome.TextEditor show-line-numbers true
gsettings set org.gnome.TextEditor indent-style 'space'
gsettings set org.gnome.TextEditor use-system-font false
gsettings set org.gnome.TextEditor custom-font 'FiraCode Nerd Font 11'

# Set gnome-terminal(Ptyxis):
gsettings set org.gnome.Ptyxis audible-bell false
gsettings set org.gnome.Ptyxis use-system-font false
gsettings set org.gnome.Ptyxis font-name 'FiraCode Nerd Font 11'

# Switch off switch-to-application shortcuts in gnome and dash-to-dock:
for i in {1..9}; do gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"; done
for i in {1..9}; do gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-$i "[]"; done

# Set static workspace:
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# Set "<Super>num" as workspace switcher:
for i in {1..6}; do gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"; done

# Set "<Super><Shift>num" to move apps to workspace:
for i in {1..6}; do gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"; done

# Close window by pressing "<Super>q"
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut "[]"
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut-text ''
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
