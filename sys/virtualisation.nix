{ config, pkgs, ... }:

{
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
    virtualbox.host.enable = true;
  };

  services.flatpak.enable = true;
}
