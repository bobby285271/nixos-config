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
    texlive.combined.scheme-full
    texstudio
    x11docker
  ];
}
