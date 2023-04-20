{ config, pkgs, ... }:

let
  libreoffice-icon-fixed = pkgs.callPackage ./pkgs/libreoffice-icon-fixed.nix { };
in
{
  environment.systemPackages = with pkgs; [
    chromium
    drawing
    firefox
    gitg
    gnome.gnome-boxes
    libreoffice-icon-fixed
    slack
    thunderbird
    vscode-fhs
  ];
}
