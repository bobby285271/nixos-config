{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.gnome = {
        enable = true;
        debug = true;
      };
      displayManager.gdm.enable = true;
    };

    flatpak.enable = true;
  };
}
