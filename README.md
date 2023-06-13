# debian-dwm
 install dwm on debian bulleye

### Download
First we need to download dwm. Replace the version number as needed. I will also download st, a terminal emulator, and dmenu, a program to quickly launch executables. Both of these make dwm more usable.

download

````
wget https://dl.suckless.org/dwm/dwm-6.4.tar.gz
wget https://dl.suckless.org/st/st-0.9.tar.gz
wget https://dl.suckless.org/tools/dmenu-5.2.tar.gz
````
optional Slstatus - You can browse its source code repository or get a copy using the following command:
git clone https://git.suckless.org/slstatus

untar

````
tar xf dwm-6.4tar.gz
tar xf st-0.9.tar.gz
tar xf dmenu-5.2.tar.gz
````

load dependences

````
sudo apt install -y make gcc git wget libx11-dev libxft-dev libxinerama-dev xorg thunar kitty nitrogen mousepad fonts-firacode
````
compile

````
cd dwm-6.4tar.gz
make
sudo make clean install
cd ..
cd st-0.9.tar.gz
make
sudo make clean install
cd dmenu-5.2.tar.gz
make
sudo make clean install
cd ..
````
Next, create a file called .xinitrc in your home directory. Place this inside of it:
````
while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
	sleep 1
done &
exec dwm
````
or use .xinitrc in your home and command "startx"




---
article https://johnjago.com/dwm/ 
