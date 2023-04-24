{ pkgs ? import <nixpkgs> { } }: {
  # Desktop
  libreoffice-icon-fixed = pkgs.callPackage ./desktop/pkgs/libreoffice-icon-fixed.nix { };
}
