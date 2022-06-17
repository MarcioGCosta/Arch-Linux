#!/bin/sh


#_____/\\\\\\\\\_________________________________/\\\_________        
# ___/\\\\\\\\\\\\\______________________________\/\\\_________       
#  __/\\\/////////\\\_____________________________\/\\\_________      
#   _\/\\\_______\/\\\__/\\/\\\\\\\______/\\\\\\\\_\/\\\_________     
#    _\/\\\\\\\\\\\\\\\_\/\\\/////\\\___/\\\//////__\/\\\\\\\\\\__    
#     _\/\\\/////////\\\_\/\\\___\///___/\\\_________\/\\\/////\\\_   
#      _\/\\\_______\/\\\_\/\\\_________\//\\\________\/\\\___\/\\\_  
#       _\/\\\_______\/\\\_\/\\\__________\///\\\\\\\\_\/\\\___\/\\\_ 
#        _\///________\///__\///_____________\////////__\///____\///__



## Ranking mirrorlist 
sudo pacman -Sy reflector && sudo reflector --sort score --threads 5 --save /etc/pacman.d/mirrorlist.
sudo rm /etc/pacman.d/mirrorlist
sudo mv /etc/pacman.d/mirrorlist. /etc/pacman.d/mirrorlist

## Installing misc  progams
sudo pacman -Syu firefox polybar kitty xorg-server mpv yt-dlp pipewire pipewire-pulse pipewire-alsa libva-intel-driver dmenu playerctl xorg-setxkbmap dash go zsh noto-fonts-emoji ttf-nerd-fonts-symbols ttf-ibm-plex feh picom bspwm sxhkd neovim xorg-xinit doas yarn npm xsel

## Folders
cp $HOME/Arch-Linux/config/.xinitrc /$HOME/.xinitrc
cp $HOME/Arch-Linux/config/.zshrc /$HOME/.zshrc
mv $HOME/Arch-Linux/config/.config /$HOME/                                                                    
## Installing misc programs in yay        
cp -r $HOME/Arch-Linux/background /$HOME/.config/

## Installing vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## Installing yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay

## Installing zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && cd zsh-syntax-highlighting && sudo make -j5 install && cd .. && rm -rf zsh-syntax-highlighting && cd

## Changing user shell to zsh
sudo chsh -s /usr/bin/zsh marcioc

## Configuring doas and Configuring neovim for doas/su 
sudo mv $HOME/Arch-Linux/config/doas.conf /etc/
sudo cp $HOME/.config/nvim /root/.config/

## Installing misc programs in yay 
yay -S ly pfetch orphan-manager dashbinsh

## Enabling ly(Display Manager)
sudo systemctl enable ly.service


