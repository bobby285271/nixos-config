{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    apostrophe
    chromium
    eclipses.eclipse-java
    firefox
    gitg
    gnome.geary
    gnome.gnome-boxes
    libreoffice-fresh
    slack
    vscode-fhs
  ];
}
