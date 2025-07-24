{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cachix
    distrobox
    dos2unix
    gcc
    gdb
    gh
    git
    gnumake
    gnupg
    gptfdisk
    # kubectl
    # minikube
    nix-update
    nixfmt
    nixpkgs-review
    ntfs3g
    # openjdk
    p7zip
    pciutils
    pinentry-curses
    tree
    unrar
    unzip
    vim
    wget
  ];
}
