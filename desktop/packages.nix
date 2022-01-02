{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    apostrophe
    eclipses.eclipse-java
    firefox
    gnome.gnome-boxes
    libreoffice-fresh
    vscode-fhs
  ];
}
