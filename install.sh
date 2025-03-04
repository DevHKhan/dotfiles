#!/bin/bash

cd

sudo pacman -Syu git base-devel --noconfirm

# Install yay

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd

# Dependencies

sudo pacman -Syu alacritty chromium dmenu dunst fakeroot feh fish \
 neovim picom pavucontrol python python-psutil ttf-font-awesome xorg-setxkbmap --noconfirm
 
yay -Syu all-repository-fonts bumblebee-status ttf-amiri --noconfirm

# Change default shell to fish

chsh -s /bin/fish

# Copy dotfiles to home directory

cd dotfiles

cp -r alacritty/ ~/.config/alacritty/
cp -r fish/ ~/.config/fish/
cp -r font-manager/ ~/.config/font-manager/
cp -r font-config/ ~/.config/fontconfig/
cp -r i3/ ~/.config/i3/
cp -r i3blocks/ ~/.config/i3blocks/
cp -r i3status/ ~/.config/i3status/
cp -r nvim/ ~/.config/nvim/
cp -r Pictures/ ~/Pictures/
cp *.sh ~/