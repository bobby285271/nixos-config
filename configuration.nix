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

  nix = {
    binaryCaches = [ 
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; 
  [
    chromium
    codeblocks
    dos2unix
    eclipses.eclipse-java
    firefox
    gcc
    gdb
    gh
    git
    gnome.file-roller
    gnome.gnome-boxes
    gnumake
    gnupg
    gptfdisk
    jdk
    jetbrains.idea-community
    libreoffice-fresh
    nodejs
    ntfs3g
    onlyoffice-bin
    p7zip
    pciutils
    pinentry-curses
    python3Minimal
    qemu
    rustup
    screenfetch
    texlive.combined.scheme-full
    texstudio
    typora
    unrar
    unzip
    vim
    vscode-fhs
    wget
  ];
}
