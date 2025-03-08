#!/usr/bin/env bash

gsettings set org.gnome.desktop.interface gtk-theme "Greybird"
gsettings set org.gnome.desktop.interface icon-theme "elementary-xfce"
gsettings set org.gnome.desktop.interface clock-show-date false

if [ $XDG_SESSION_TYPE = "wayland" ]; then
  xfconf-query -c displays -n -t double -p "/Default/eDP-1/Scale" -s 2.0000
  xfconf-query -c xsettings -n -t int -p "/Gdk/WindowScalingFactor" -s 1
  gsettings set org.gnome.desktop.interface cursor-size 24
  echo 'Xft.dpi:96' | xrdb -merge
  systemctl --user import-environment DISPLAY WAYLAND_DISPLAY DBUS_SESSION_BUS_ADDRESS XDG_SESSION_ID
  # wlr-randr --output eDP-1 --scale 2
else
  xfconf-query -c displays -n -t double -p "/Default/eDP-1/Scale" -s 1.0000
  xfconf-query -c xfwm4 -n -t string -p "/general/theme" -s Default-xhdpi
  xfconf-query -c xsettings -n -t int -p "/Gdk/WindowScalingFactor" -s 2
  gsettings set org.gnome.desktop.interface cursor-size 48
  echo 'Xft.dpi:192' | xrdb -merge
fi

xfconf-query --create --type string -c displays -p /Schemes/Apply -s Default

sudo bash /home/bobby285271/nixos/helper/nix-daemon-proxy.sh
