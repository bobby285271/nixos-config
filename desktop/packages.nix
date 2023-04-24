{ config, pkgs, ... }:

let
  libreoffice-icon-fixed = pkgs.callPackage ./pkgs/libreoffice-icon-fixed.nix { };
  dingtalk = pkgs.callPackage ./pkgs/dingtalk { };
in
{
  environment.systemPackages = with pkgs; [
    chromium
    dingtalk
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
