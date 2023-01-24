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
        theme.name = "Qogir-Dark";
        theme.package = pkgs.qogir-theme;
        iconTheme.name = "Qogir";
        iconTheme.package = pkgs.qogir-icon-theme;
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
    qogir-theme
    qogir-icon-theme
    networkmanagerapplet
  ];
}
