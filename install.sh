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



## Installing misc  progams
sudo pacman -Sy reflector && sudo reflector --sort score --threads 5 --save /etc/pacman.d/mirrorlist
sudo pacman -Syu firefox polybar kitty xorg-server mpv yt-dlp pipewire pipewire-pulse pipewire-alsa libva-intel-driver dmenu playerctl xorg-setxkbmap dash go zsh noto-fonts-emoji ttf-nerd-fonts-symbols ttf-ibm-plex feh picom bspwm sxhkd neovim xorg-xinit doas yarn npm xsel


cp $HOME/Arch-Linux/config/.xinitrc /$HOME/.xinitrc
cp $HOME/Arch-Linux/config/.zshrc /$HOME/.zshrc
mv $HOME/Arch-Linux/config/.config /$HOME/
cp -r $HOME/Arch-Linux/background /$HOME/.config/

## Installing vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## Installing yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay

## Installing zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && cd zsh-syntax-highlighting && sudo make install && cd .. && rm -rf zsh-syntax-highlighting && cd

## Changing user shell to zsh
sudo chsh -s /usr/bin/zsh marcioc

## Configuring doas and Configuring neovim for doas/su 
sudo su && touch /etc/doas.conf && echo "permit nopass marcioc as root" >> /etc/doas.conf && mkdir /root/.config/ && mkdir /root/.config/nvim && cp $HOME/Arch-Linux/config/init.vim /root/.config/ && su marcioc

## Installing misc programs in yay 
yay -S pfetch orphan-manager dashbinsh

