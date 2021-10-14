{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    codeblocks
    eclipses.eclipse-java
    gnome.gnome-boxes
    jetbrains.idea-community
    libreoffice-fresh
    qemu
    x11docker
  ];
}
