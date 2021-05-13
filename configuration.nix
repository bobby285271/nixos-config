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
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; 
  [
    ark
    codeblocks
    dos2unix
    firefox
    gcc
    gdb
    git
    gnumake
    gnupg
    gptfdisk
    gwenview
    jdk
    kate
    kcalc
    kdevelop
    libreoffice-qt
    neofetch
    nodejs
    ntfs3g
    okular
    onlyoffice-bin
    p7zip
    pciutils
    pinentry-curses
    python3Minimal
    qemu
    qtcreator
    rustup
    texlive.combined.scheme-full
    texstudio
    typora
    unrar
    unzip
    vim
    vlc
    vscode-fhs
    wget
  ];

}
