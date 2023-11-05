{ pkgs, ... }:

{
  hardware.nvidia.prime.offload.enableOffloadCmd = true;
  networking.hostName = "inspiron";
  zramSwap.enable = true;
}
