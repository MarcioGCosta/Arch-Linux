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


## Uncommenting lines in pacman.conf, and making output prettier
sudo sed '/Color/s/^#//' -i /etc/pacman.conf && sudo sed '/ParallelDownloads/s/^#//' -i /etc/pacman.conf && sudo sed '/Color/a ILoveCandy' /etc/pacman.conf

## Ranking mirrorlist 
sudo pacman -Sy reflector && sudo reflector --sort score --threads 5 --save /etc/pacman.d/mirrorlist. && sudo rm /etc/pacman.d/mirrorlist && sudo mv /etc/pacman.d/mirrorlist. /etc/pacman.d/mirrorlist

## Installing misc progams
sudo pacman -Syu htop ufw ntp wireplumber pipewire-jack firefox polybar kitty xorg-server mpv yt-dlp pipewire pipewire-pulse pipewire-alsa libva-intel-driver dmenu playerctl xorg-setxkbmap dash go zsh noto-fonts-emoji ttf-nerd-fonts-symbols ttf-ibm-plex feh picom bspwm sxhkd neovim xorg-xinit doas yarn npm xsel

## Folders
cp $HOME/Arch-Linux/config/.xinitrc /$HOME/.xinitrc && cp $HOME/Arch-Linux/config/.zshrc /$HOME/.zshrc && mv $HOME/Arch-Linux/config/.config /$HOME/ && cp -r $HOME/Arch-Linux/background /$HOME/.config/

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
sudo mv $HOME/Arch-Linux/config/doas.conf /etc/ && sudo cp -r $HOME/.config/nvim/ /root/.config/

## Installing misc programs in yay 
yay -S ly firefox-h264ify firefox-ublock-origin firefox-decentraleyes firefox-dark-reader pfetch orphan-manager dashbinsh

## Enabling daemons
sudo systemctl enable ly.service && sudo systemctl enable ufw.service && sudo systemctl enable ntpd.service

## Setting timezone
sudo timedatectl set-timezone America/Sao_Paulo

## Installing vim-plug to root user
sudo mv /$HOME/Arch-Linux/config/vim-plug.sh /root 

sudo su | echo "Run ./vim-plug.sh"
