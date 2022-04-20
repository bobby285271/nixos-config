{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    apostrophe
    chromium
    eclipses.eclipse-java
    firefox
    gitg
    gnome.gnome-boxes
    libreoffice-fresh
    vscode-fhs
  ];

  environment.variables.MOZ_DISABLE_CONTENT_SANDBOX = "1";
}
