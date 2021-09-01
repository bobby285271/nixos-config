{ config, pkgs, ... }:

{
  imports = [
    ./nixpkgs.nix
    ./nur.nix
    ./custom.nix
 ];
}
