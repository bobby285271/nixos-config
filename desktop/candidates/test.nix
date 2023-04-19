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
          theme.name = "Orchis";
          iconTheme.name = "Tela";
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
    orchis-theme
    tela-icon-theme
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-genmon-plugin
  ];

  services.gnome.gnome-keyring.enable = true;

  system.replaceRuntimeDependencies = [
    ({
      original = pkgs.wayland;
      replacement = pkgs.wayland.overrideAttrs (oldAttrs: {
        version = "1.22.0";
        src = fetchurl {
          url = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz";
          hash = "sha256-FUCvHqaYpHHC2OnSiDMsfg/TYMjx0Sk267fny8JCWEI=";
        };
      });
    })
  ];
}
