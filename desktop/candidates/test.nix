{ pkgs, ... }:

{
  environment.sessionVariables."G_SLICE" = "always-malloc";

  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.budgie = {
        enable = true;
        extraPlugins = [
          pkgs.budgie.budgie-analogue-clock-applet
        ];
      };
      displayManager = {
        lightdm.greeters.slick = {
          enable = true;
          theme.name = "Orchis";
          iconTheme.name = "Tela";
          draw-user-backgrounds = true;
        };
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
    orchis-theme
    tela-icon-theme
  ];
}
