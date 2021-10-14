{ config, pkgs, ... }:

{
  services.tlp.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  system = {
    autoUpgrade.enable = true;
    stateVersion = "21.11";
  };
}
