{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.xfce.enable = true;
      displayManager = {
        lightdm.greeters.slick = {
          enable = true;
          theme.name = "Mint-Y-Aqua";
          iconTheme.name = "Mint-Y-Aqua";
          draw-user-backgrounds = true;
        };
        defaultSession = "xfce";
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
    cinnamon.mint-y-icons
    cinnamon.mint-themes
  ];

  services.gnome.gnome-keyring.enable = true;
}
