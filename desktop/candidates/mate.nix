{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.mate.enable = true;
      displayManager.lightdm.greeters.slick = {
        enable = true;
        theme.name = "BlueMenta";
        iconTheme.name = "mate";
        draw-user-backgrounds = true;
      };
    };
    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
