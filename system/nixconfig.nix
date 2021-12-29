{ config, pkgs, ... }:

{
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      auto-optimise-store = true
      flake-registry = https://cdn.jsdelivr.net/gh/NixOS/flake-registry/flake-registry.json
    '';

    binaryCaches = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://bobby285271.cachix.org"
    ];

    binaryCachePublicKeys = [
      "bobby285271.cachix.org-1:suZrwf/wphZbNXocjgcc49lcn/RB0iFxlh1peSVOE3w="
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowAliases = false;
  };
}
