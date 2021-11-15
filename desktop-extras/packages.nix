{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    codeblocks
    eclipses.eclipse-java
    gnome.gnome-boxes
    jetbrains.idea-community
    libreoffice-fresh
    meteo
    qemu
    texstudio
    x11docker
  ];
}
