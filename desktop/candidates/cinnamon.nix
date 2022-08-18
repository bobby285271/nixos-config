{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.cinnamon.enable = true;
      displayManager.lightdm.greeters.slick = {
        theme.name = "Mint-Y-Dark";
        iconTheme.name = "Mint-Y";
      };
    };
    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
