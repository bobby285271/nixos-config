{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    desktopManager.pantheon = {
      enable = true;
      debug = true;
      extraSwitchboardPlugs = [ pkgs.pantheon-tweaks ];
    };

    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

}
