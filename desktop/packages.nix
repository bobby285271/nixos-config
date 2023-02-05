{ config, pkgs, ... }:

let
  libreoffice-icon-fixed = pkgs.callPackage ./libreoffice-icon-fixed.nix { };

  # Using third party icon?
  is-tp-icon = ((!config.services.xserver.desktopManager.gnome.enable) && (!config.services.xserver.desktopManager.pantheon.enable));
in
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
    (if is-tp-icon then libreoffice-icon-fixed else libreoffice-fresh)
    # marktext
    slack
    thunderbird
    vscode-fhs
  ];
}
