{
  environment.localBinInPath = true;

  services = {
    openssh.enable = true;
    thermald.enable = true;
  };
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  system = {
    autoUpgrade.enable = true;
    stateVersion = "22.05";
  };
}
