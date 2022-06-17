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



sudo pacman -Sy reflector 

sudo reflector --sort score --threads 5 --save /etc/pacman.d/mirrorlist


sudo pacman -Syu firefox polybar kitty xorg-server mpv yt-dlp pipewire pipewire-pulse pipewire-alsa libva-intel-driver dmenu playerctl xorg-setxkbmap dash go zsh noto-fonts-emoji ttf-nerd-fonts-symbols ttf-ibm-plex feh picom bspwm sxhkd neovim xorg-xinit doas yarn npm xsel

mkdir -p $HOME/.config/picom
mkdir -p $HOME/.config/bspwm
mkdir -p $HOME/.config/sxhkd
mkdir -p $HOME/.config/polybar
mkdir -p $HOME/.config/nvim	
mkdir -p $HOME/.config/kitty
mkdir -p $HOME/.xinit

touch $HOME/.xinitrc

echo "exec bspwm" > $HOME/.xinitrc

cp $HOME/Arch-Linux/config/.zshrc /$HOME/.zshrc
cp $HOME/Arch-Linux/config/config.ini /$HOME/.config/polybar
cp $HOME/Arch-Linux/config/launch.sh /$HOME/.config/polybar
cp $HOME/Arch-Linux/config/bspwmrc /$HOME/.config/bspwm/
cp $HOME/Arch-Linux/config/sxhkdrc /$HOME/.config/sxhkd/
cp $HOME/Arch-Linux/config/init.vim /$HOME/.config/nvim/
cp -r $HOME/Arch-Linux/background /$HOME/.config/
cp $HOME/Arch-Linux/config/kitty.conf /$HOME/.config/kitty/
cp $HOME/Arch-Linux/config/picom.conf /$HOME/.config/picom

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

git clone https://aur.archlinux.org/yay.git

cd yay 

makepkg -si

cd ..

rm -rf yay

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

cd zsh-syntax-highlighting

sudo make install

cd ..

rm -rf zsh-syntax-highlighting

sudo chsh -s /usr/bin/zsh marcioc

yay -S  pfetch orphan-manager dashbinsh

sudo su

touch /etc/doas.conf && echo "permit nopass marcioc as root" >> /etc/doas.conf

mkdir /root/.config/ && mkdir /root/.config/nvim && cp $HOME/Arch-Linux/config/init.vim /root/.config/

su marcioc

