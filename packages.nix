{ pkgs ? import <nixpkgs> { } }: {
  # Desktop
  clash-for-windows = pkgs.callPackage ./desktop/pkgs/clash-for-windows.nix { };
  libreoffice-icon-fixed = pkgs.callPackage ./desktop/pkgs/libreoffice-icon-fixed.nix { };
  dingtalk = pkgs.callPackage ./desktop/pkgs/dingtalk { };
  mate-menu = pkgs.callPackage ./desktop/pkgs/mate-menu.nix { };
}
