{ config, pkgs, ... }:

{
  imports = [
    ./inspiron-light.nix
    ../desktop-extras/default.nix
    ../system-extras/default.nix
 ];
}
