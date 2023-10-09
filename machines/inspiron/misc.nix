{ pkgs, ... }:

{
  networking.hostName = "inspiron";
  zramSwap.enable = true;
}
