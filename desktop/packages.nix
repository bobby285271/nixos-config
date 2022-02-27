{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    apostrophe
    eclipses.eclipse-java
    firefox
    gitg
    gnome.gnome-boxes
    libreoffice-fresh
    vscode-fhs
  ];
}
