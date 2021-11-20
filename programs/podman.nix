{ config, pkgs, ... }:

{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
