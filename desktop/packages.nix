{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # apostrophe
    chromium
    drawing
    # eclipses.eclipse-java
    firefox
    gitg
    glib
    gnome.gnome-boxes
    libreoffice-fresh
    # marktext
    slack
    thunderbird
    vscode-fhs
  ];
}
