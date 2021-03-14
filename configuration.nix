# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./sys/boot.nix
    ./sys/desktop.nix
    ./sys/fonts.nix
    ./sys/i18n.nix
    ./sys/network.nix
    ./sys/system.nix
    ./sys/users.nix
    ./sys/virtualisation.nix
  ];

  nix.binaryCaches = [ 
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://nixos-homepage.cachix.org"
  ];

  nix.binaryCachePublicKeys = [ "nixos-homepage.cachix.org-1:NHKBt7NjLcWfgkX4OR72q7LVldKJe/JOsfIWFDAn/tE=" ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; 
  [
    dos2unix
    firefox
    gcc
    gdb
    git
    gnome-latex
    gnumake
    gnupg
    gptfdisk
    libreoffice-fresh
    neofetch
    p7zip
    pciutils
    pinentry-curses 
    python3Minimal
    qemu
    rustup
    texlive.combined.scheme-full
    transmission
    vim
    wget
  ];
}
