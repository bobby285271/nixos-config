{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
      auto-optimise-store = true
    '';
    binaryCaches = [ 
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
  };

  nixpkgs.config.allowUnfree = true;
}
