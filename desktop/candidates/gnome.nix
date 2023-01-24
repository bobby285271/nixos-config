{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable =  true;
    };
    flatpak.enable = true;
  };

  xdg.portal.enable = true;
}
