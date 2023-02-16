{
  environment.localBinInPath = true;

  services = {
    openssh.enable = true;
    thermald.enable = true;
    printing.enable = true;
  };
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  system.stateVersion = "22.11";
}
