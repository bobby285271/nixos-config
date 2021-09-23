{ config, pkgs, ... }:

{
  nix = {
    binaryCaches = [ 
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; 
  [
    bat
    cachix
#    chromium
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
    nix-update
    nixpkgs-review
    nodejs
    ntfs3g
    p7zip
    pantheon.appcenter
    pciutils
    pinentry-curses
    python3Minimal
    qemu
    rustup
    screenfetch
#    texlive.combined.scheme-full
#    texstudio
    tree
    unrar
    unzip
    vim
    vscode-fhs
    wget
    x11docker
  ];
}
