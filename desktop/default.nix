{ config, pkgs, ... }:

{
  imports = [
    ./fcitx.nix
    ./fonts.nix
    ./misc.nix
    ./packages.nix
    ./pantheon.nix
 ];
}
