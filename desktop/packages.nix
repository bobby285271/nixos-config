{ config, pkgs, ... }:

let
  libreoffice-icon-fixed = pkgs.callPackage ./pkgs/libreoffice-icon-fixed.nix { };
in
{
  environment.systemPackages = with pkgs; [
    # apostrophe
    chromium
    drawing
    # eclipses.eclipse-java
    firefox
    gitg
    # gnome.gnome-boxes
    # libreoffice-icon-fixed
    # marktext
    slack
    thunderbird
    vscode-fhs
    wpsoffice-cn
  ];

  environment.variables."NIXPKGS_NO_GC_PATH" = [
    "${pkgs.wpsoffice-cn.src}"
  ];
}
