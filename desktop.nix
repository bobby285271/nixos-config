# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./desktop/boot.nix
    ./desktop/fonts.nix
    ./desktop/i18n.nix
    ./desktop/network.nix
    ./desktop/pantheon.nix
    ./desktop/system.nix
    ./desktop/users.nix
    ./desktop/virtualisation.nix
 ];
}
