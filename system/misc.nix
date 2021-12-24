{ config, pkgs, ... }:

{
  services = {
    tlp.enable = true;
    openssh.enable = true;
  };
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  system = {
    autoUpgrade.enable = true;
    stateVersion = "22.05";
  };
}
