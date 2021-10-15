{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./misc.nix
    ./network.nix
    ./nixconfig.nix
    ./packages.nix
    ./users.nix
    ./zsh.nix
  ];
}
