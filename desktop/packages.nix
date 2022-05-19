{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    apostrophe
    chromium
    eclipses.eclipse-java
    firefox
    geary
    gitg
    gnome.gnome-boxes
    libreoffice-fresh
    slack
    vscode-fhs
  ];
}
