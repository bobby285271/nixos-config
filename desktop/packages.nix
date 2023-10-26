{ config, pkgs, ... }:

let
  libreoffice-icon-fixed = pkgs.callPackage ./pkgs/libreoffice-icon-fixed.nix { };
  # dingtalk = pkgs.callPackage ./pkgs/dingtalk { };
  # clash-for-windows = pkgs.callPackage ./pkgs/clash-for-windows.nix { };
in
{
  environment.systemPackages = with pkgs; [
    # clash-for-windows
    # chromium
    # terminate called after throwing an instance of 'std::bad_alloc'
    # dingtalk
    # drawing
    # firefox
    gitg
    # gnome.gnome-boxes
    # libreoffice-icon-fixed
    # slack
    # thunderbird
    vscode-fhs
    # vscodium-fhs
#    loupe
  
    # gnome.polari
  ];
}
