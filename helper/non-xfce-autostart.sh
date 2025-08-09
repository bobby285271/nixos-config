#!/usr/bin/env bash
gsettings reset-recursively org.gnome.desktop.wm.preferences || true
gsettings reset-recursively org.gnome.settings-daemon.plugins.xsettings || true
for i in icon-theme gtk-theme cursor-size cursor-theme clock-show-date; do
  gsettings reset org.gnome.desktop.interface $i || true
done

sudo bash /home/bobby285271/nixos/helper/nix-daemon-proxy.sh

# Hmmm?
sudo rm -rf /home/bobby285271/.config/autostart/gnome-.desktop
