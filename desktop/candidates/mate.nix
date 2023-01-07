{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.mate.enable = true;
      displayManager.lightdm.greeters.slick = {
        enable = true;
        theme.name = "Vimix";
        theme.package = pkgs.vimix-gtk-theme;
        iconTheme.name = "Vimix";
        iconTheme.package = pkgs.vimix-icon-theme;
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
    vimix-gtk-theme
    vimix-icon-theme
    networkmanagerapplet
  ];
}
