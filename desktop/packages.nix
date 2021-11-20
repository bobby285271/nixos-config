{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    gnome.gnome-boxes
    vscodium
  ];
}
