{ config, pkgs, ... }:

{
  imports = [
    ./inspiron/boot.nix
    ./inspiron/hardware.nix
 ];
}
