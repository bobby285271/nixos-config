{ config, pkgs, ... }:

{
  imports = [
    ./network.nix
    ./packages.nix
    ./virtualisation.nix
  ];
}
