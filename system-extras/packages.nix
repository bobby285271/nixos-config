{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    openjdk
    nixos-generators
    nodejs
    rustup
  ];
}
