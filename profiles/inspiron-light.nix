{ config, pkgs, ... }:

{
  imports = [
    ../desktop/default.nix
    ../inspiron/default.nix
    ../system/default.nix
 ];
}
