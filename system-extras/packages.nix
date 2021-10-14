{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    openjdk
    nodejs
    rustup
  ];
}
