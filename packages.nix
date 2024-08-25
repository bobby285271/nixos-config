{
  pkgs ? import <nixpkgs> { },
}:
{
  # Desktop
  libreoffice-icon-fixed = pkgs.callPackage ./desktop/pkgs/libreoffice-icon-fixed.nix { };
  dingtalk = pkgs.callPackage ./desktop/pkgs/dingtalk { };
  mate-menu = pkgs.callPackage ./desktop/pkgs/mate-menu.nix { };
}
