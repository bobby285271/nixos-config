{ lib, pkgs, ... }:

{
  nix = {
    # package = pkgs.lix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      flake-registry = "${./registry.json}";
      # substituters = lib.mkForce [
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        # "https://bobby285271.cachix.org"
      ];
      # trusted-public-keys = [
      #   "bobby285271.cachix.org-1:suZrwf/wphZbNXocjgcc49lcn/RB0iFxlh1peSVOE3w="
      # ];
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowAliases = true;
  };
}
