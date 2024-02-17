{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.xfce.enable = true;
      displayManager = {
        lightdm = {
          background = "/var/lib/wallpaper/bobby285271/current.jpg";
          greeters.gtk = {
            enable = true;
            # extraConfig = "user-background = false";
            theme.name = "Qogir-Light";
            iconTheme.name = "Qogir";
            indicators = [
              "~host"
              "~spacer"
              "~clock"
              "~session"
              "~language"
              "~a11y"
              "~power"
            ];
          };
        };
        defaultSession = "xfce";
      };
    };
    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      (pkgs.xdg-desktop-portal-gtk.override {
        # Use the upstream default so this won't conflict with the xapp portal.
        # buildPortalsInGnome = false;
      })
      # pkgs.xdg-desktop-portal-xapp
    ];
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    qogir-theme
    qogir-icon-theme
    xfce.xfce4-clipman-plugin
    xfce.xfce4-whiskermenu-plugin
    mate.engrampa
    # cinnamon.xapp
    # file
  ];

  programs.thunar.plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];

  # environment.pathsToLink = [ "/share" ];

  programs.nm-applet.enable = true;
  programs.nm-applet.indicator = true;

  services.gnome.gnome-keyring.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      xfce = super.xfce.overrideScope (pself: psuper: {
        xfwm4 = psuper.xfwm4.overrideAttrs (oldAttrs: {
          patches = (oldAttrs.patches or [ ]) ++ [
            # https://gitlab.xfce.org/xfce/xfwm4/-/merge_requests/27
            ../patches/xfwm4-title-center.patch
          ];
        });
      });
    })
  ];
}
