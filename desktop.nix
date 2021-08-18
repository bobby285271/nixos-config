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
