{
  environment = {
    enableDebugInfo = true;
    localBinInPath = true;
  };

  services = {
    openssh.enable = true;
    thermald.enable = true;
    printing.enable = true;
    power-profiles-daemon.enable = false;
    tlp.enable = true;
  };
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  system.stateVersion = "23.05";
}
