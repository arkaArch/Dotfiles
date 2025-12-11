#!/bin/sh

# Install DrRacket:
sudo pacman -S racket


# Setup for python:
#------------------------

# Install pycharm:
sudo pacman -S pycharm-community-edition
"""
{
    When open pycharm for first time you can see the notification in IDE that:
        
        - The IDE seems to be launched with a script launcher ('bin/pycharm.sh'). 
        - Please consider switching to a native launcher ('bin/pycharm') for better experience
    Now this happens because the IDE opens with pycharm script not the actual pycharm executable.

    To solve this go to /usr/bin directory. Move the pycharm script with:
        [/usr/bin]$ sudo mv pycharm pycharm.bak
    Then symlink the executable file in the /usr/bin directory by:
        [/usr/bin]$ sudo ln -sv /usr/share/pycharm/bin/pycharm pycharm
}
"""

# Install pip:
sudo pacman -S python-pip

# Install virtual environment:
sudo pacman -S python-virtualenv

# To install tkinter (for gui modules like FreeSampleGui to work):
sudo pacman -S tk
