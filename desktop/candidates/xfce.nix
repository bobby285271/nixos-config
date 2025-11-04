{ pkgs, ... }:

{
  services = {
    greetd = {
      enable = true;
      settings.default_session.command = "${pkgs.cage}/bin/cage -s -- sh -c 'wlr-randr --output eDP-1 --scale 2 && GTK_THEME=Greybird ${pkgs.gtkgreet}/bin/gtkgreet'";
    };

    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.xfce = {
        enable = true;
        enableWaylandSession = true;
      };
      displayManager.startx.enable = true;
    };
    displayManager.defaultSession = "xfce";
    flatpak.enable = true;

  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-xapp
    ];
  };

  environment = {
    sessionVariables = {
      QT_SCALE_FACTOR = "2";
      # GDK_DPI_SCALE = "0.5";
      # QT_FONT_DPI = "96";
    };

    etc."greetd/environments".text = ''
      startxfce4
      startxfce4 --wayland
    '';

    systemPackages = with pkgs; [
      networkmanagerapplet
      greybird
      elementary-xfce-icon-theme
      xfce.xfce4-clipman-plugin
      xfce.xfce4-pulseaudio-plugin
      xfce.xfce4-whiskermenu-plugin
      mate.engrampa
      # xapp
      # file
      # xfce.xfmpc
      vala-language-server
      wlr-randr
    ];
  };

  programs = {
    thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-vcs-plugin
      thunar-volman
    ];
    nm-applet = {
      enable = true;
      indicator = true;
    };
    # wayfire = {
    #   enable = true;
    #   plugins = with pkgs.wayfirePlugins; [
    #     wcm
    #     wayfire-plugins-extra
    #   ];
    # };
    seahorse.enable = true;
  };

  hardware.bluetooth.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      xfce = super.xfce.overrideScope (
        pself: psuper: {
          xfwm4 = psuper.xfwm4.overrideAttrs (oldAttrs: {
            patches = (oldAttrs.patches or [ ]) ++ [
              # https://gitlab.xfce.org/xfce/xfwm4/-/merge_requests/27
              ../patches/xfwm4-title-center.patch
            ];
          });
          # xfce4-screensaver = psuper.xfce4-screensaver.overrideAttrs (oldAttrs: {
          #   patches = (oldAttrs.patches or [ ]) ++ [
          #     ../patches/xfce4-screensaver-wallpaper.patch
          #   ];
          # });
        }
      );
    })
  ];
}
