{ pkgs, inputs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.budgie.enable = true;
      libinput.enable = true;
      displayManager.lightdm.greeters.slick.draw-user-backgrounds = true;
    };
    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
