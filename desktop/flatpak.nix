{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  services.flatpak.enable = true;
}
