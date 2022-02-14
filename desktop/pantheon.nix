{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    desktopManager.pantheon = {
      enable = true;
      debug = true;
      extraSwitchboardPlugs = [ pkgs.pantheon-tweaks ];
    };
  };
}
