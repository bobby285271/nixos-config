{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
 ];
}
