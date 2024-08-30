{ config, pkgs, ... }:

let
in
# libreoffice-icon-fixed = pkgs.callPackage ./pkgs/libreoffice-icon-fixed.nix { };
# dingtalk = pkgs.callPackage ./pkgs/dingtalk { };
{
  environment.systemPackages = with pkgs; [
    chromium
    # terminate called after throwing an instance of 'std::bad_alloc'
    # dingtalk
    drawing
    # firefox
    gitg
    gnome-boxes
    libreoffice-fresh
    # slack
    thunderbird
    vscode-fhs
    # vscodium-fhs
  ];
}
