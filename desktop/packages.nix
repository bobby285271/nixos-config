{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    eclipses.eclipse-java
    firefox
    gnome.gnome-boxes
    libreoffice-fresh
    marktext
    vscode-fhs
  ];
}
