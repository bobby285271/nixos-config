{ config, pkgs, ... }:

{
  nix = {
    registry.nixpkgs = {
      from = {
        type = "indirect";
        id = "local";
      };
      to = {
        type = "git";
        ref = "nixos-unstable";
        url = "file:///home/bobby285271/nixpkgs";
      };
    };

    trustedUsers = [
      "root"
      "bobby285271"
    ];
  };
}
