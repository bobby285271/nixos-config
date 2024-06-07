{ lib, pkgs, ... }:

{
  environment = {
    # enableDebugInfo = true;
    localBinInPath = true;
  };

  services = {
    openssh.enable = true;
    thermald.enable = true;
    printing.enable = true;
    power-profiles-daemon.enable = false;
    tlp.enable = true;
    pipewire = {
      enable = true;
      systemWide = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    mpd = {
      enable = true;
      extraConfig = ''
        auto_update "yes"

        audio_output {
          type "pipewire"
          name "pipewire"
        }
      '';
    };
  };
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  system.stateVersion = "23.11";
}
