#!/bin/bash

cd

sudo pacman -Syu git base-devel --noconfirm

# Install yay

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd

# Dependencies

sudo pacman -Syu alacritty chromium code dmenu dunst fakeroot feh fish \
 gcc git i3 i3blocks i3status neovim network-manager-applet pavucontrol\
 picom python python-psutil \ ttf-font-awesome ttf-jetbrains-mono \
 volumeicon xorg-setxkbmap --noconfirm
 
yay -Syu all-repository-fonts bumblebee-status --noconfirm

# Change default shell to fish

chsh -s /bin/fish

# Copy dotfiles to home directory

cd dotfiles

cp -r alacritty/ ~/.config/alacritty/
cp -r fish/ ~/.config/fish/
cp -r i3/ ~/.config/i3/
cp -r nvim/ ~/.config/nvim/
cp -r Pictures/ ~/Pictures/
cp *.sh ~/

# Done!

echo "The installation script has finished! Please reboot to finish the process."