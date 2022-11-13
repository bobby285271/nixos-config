{ pkgs, ... }:

{
  services = {
    packagekit.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.mate.enable = true;
      displayManager.lightdm.greeters.slick = {
        enable = true;
        theme.name = "Mint-Y";
        theme.package = pkgs.cinnamon.mint-themes;
        iconTheme.name = "Mint-Y-Dark";
        iconTheme.package = pkgs.cinnamon.mint-y-icons;
        draw-user-backgrounds = true;
      };
    };
    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  nixpkgs.overlays = [
    (self: super: {
      # Nothing yet!
    })
  ];

  environment.systemPackages = with pkgs; [
    cinnamon.mint-themes
    cinnamon.mint-y-icons
    networkmanagerapplet
  ];
}
