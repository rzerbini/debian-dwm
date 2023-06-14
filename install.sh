#!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# xorg display server installation
# sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput xorg-dev
# sudo apt install make gcc libx11-dev libxft-dev libxinerama-dev xorg

sudo apt install -y make gcc git wget libx11-dev libxft-dev libxinerama-dev xorg

sudo apt install -y thunar kitty nitrogen mousepad fonts-firacode lxappearance

# INCLUDES make,etc.
# sudo apt install -y build-essential 

# Microcode for Intel/AMD 
# sudo apt install -y amd64-microcode
# sudo apt install -y intel-microcode 

# Network Manager
sudo apt install -y network-manager-gnome

# Installation for Appearance management
# sudo apt install -y lxappearance 

# File Manager (eg. pcmanfm,krusader)
# sudo apt install -y thunar

# Network File Tools/System Events
# sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends xfce4-power-manager timeshift

# sudo systemctl enable avahi-daemon
# sudo systemctl enable acpid

# Terminal (eg. terminator,kitty)
#sudo apt install -y tilix

# Sound packages
#sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

# Neofetch/HTOP
sudo apt install -y neofetch htop

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo apt install -y exa

# Printing and bluetooth (if needed)
#sudo apt install -y cups
#sudo apt install -y bluez blueman

#sudo systemctl enable bluetooth
#sudo systemctl enable cups

# Browser Installation (eg. chromium)
sudo apt install -y firefox

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# example if you want to use in autostart located in ~/.local/share/dwm/autostart.sh
sudo apt install -y feh
sudo apt install -y nitrogen 

# Packages needed dwm after installation
# sudo apt install -y picom numlockx rofi dunst libnotify-bin unzip policykit-1-gnome scrot mousepad

# Command line text editor -- nano preinstalled  -- I like micro but vim is great
#sudo apt install -y micro
# sudo apt install -y neovim

# Install fonts
# sudo apt install fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus 

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# Install Lightdm Console Display Manager
sudo apt install -y lightdm lightdm-gtk-greeter-settings slick-greeter
sudo systemctl enable lightdm
echo 'greeter-session=slick-greeter' >>  sudo tee -a /etc/lightdm/lightdm.conf
echo 'greeter-hide-user=false' >>  sudo tee -a /etc/lightdm/lightdm.conf

# Ly Console Manager
# Needed packages
# sudo apt install -y libpam0g-dev libxcb-xkb-dev
#cd 
#git clone --recurse-submodules https://github.com/fairyglade/ly
#cd ly
#make
#sudo make install installsystemd
#sudo systemctl enable ly.service

# XSessions and dwm.desktop
if [[ ! -d /usr/share/xsessions ]]; then
    sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/dwm.desktop;rm ./temp


# Creating directories
#mkdir ~/.config/suckless

#sudo apt install -y libx11-dev

# Move install directory, make, and install
# cd ~
# git clone https://github.com/rzerbini/debian-dwm.git

cd ~
tools=( "dwm-6.4" "dmenu-5.2" "st-0.9" "slstatus" )
for tool in ${tools[@]}
do 
	cd ~/debian-dwm/.config/dwm/$tool;make;sudo make clean install;cd ..
done

# Install Nerd Fonts
#source ~/dwm-debian/nerdfonts.sh

cp ~/.config/debian-dwm/.xinitrc ~/.xinitrc~
cp ~/.config/debian-dwm/Pictures/*.* ~/Pictures/

#sudo apt autoremove

printf "\e[1;32mDone! you can now reboot.\e[0m\n"