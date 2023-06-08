#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# slstatus Bar
#/usr/local/bin/slstatus &

xrandr --output Virtual1 --mode 1440x900

# Restore wallpaper
nitrogen --restore &

#Compositor
#compton -b &
picom -CG --no-fading-openclose &


#loop 
while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
	sleep 1
done &

#~/.config/chadwm/scripts/bar.sh &

exec dwm


