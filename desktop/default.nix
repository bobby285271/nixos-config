{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./i18n.nix
    ./network.nix
    ./pantheon.nix
    ./system.nix
    ./users.nix
    ./virtualisation.nix
 ];
}
