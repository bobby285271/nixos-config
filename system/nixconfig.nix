{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
      auto-optimise-store = true
      flake-registry = https://raw.fastgit.org/NixOS/flake-registry/master/flake-registry.json
    '';
    binaryCaches = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];

    registry.nixpkgs = {
      from = {
        type = "indirect";
        id = "local";
      };
      to = {
        type = "path";
        path = "/home/bobby285271/nixpkgs";
      };
    };
  };

  nixpkgs.config.allowUnfree = true;
}
