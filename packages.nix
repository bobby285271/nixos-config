{ pkgs ? import <nixpkgs> { } }: {
  libreoffice-icon-fixed = pkgs.callPackage ./desktop/pkgs/libreoffice-icon-fixed.nix { };
}
