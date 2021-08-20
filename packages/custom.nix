{ config, pkgs, ... }:

{
  nixpkgs.config = {
    packageOverrides = pkgs: rec {
      # package_name = pkgs.callPackage ./package_name/default.nix { };
    };
  };

  environment.systemPackages = with pkgs; [
  ];
}