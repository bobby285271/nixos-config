{ pkgs, ... }:

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
    nixpkgs-fmt
    nixpkgs-review
    ntfs3g
    openjdk
    p7zip
    pciutils
    pinentry-curses
    screenfetch
    tree
    unrar
    unzip
    vim
    wget
  ];
}
