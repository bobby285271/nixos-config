{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cachix
    dos2unix
    gcc
    gdb
    gh
    git
    gnumake
    gnupg
    gptfdisk
    nix-update
    nixpkgs-review
    ntfs3g
    p7zip
    pciutils
    pinentry-curses
    python3Minimal
    screenfetch
    tree
    unrar
    unzip
    vim
    wget
  ];
}
