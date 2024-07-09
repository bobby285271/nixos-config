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
            theme.name = "Mint-Y-Aqua";
            iconTheme.name = "Papirus";
            indicators = [
              "~host"
              "~spacer"
              "~session"
              "~language"
              "~a11y"
              "~clock"
              "~power"
            ];
            clock-format = "%a, %b %d, %H:%M";
          };
        };
      };
    };
    displayManager.defaultSession = "xfce";
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
    # qogir-theme
    # qogir-icon-theme
    xfce.xfce4-clipman-plugin
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-whiskermenu-plugin
    mate.engrampa
    # cinnamon.xapp
    # file
    xfce.xfmpc
    vala-language-server
    papirus-icon-theme
    cinnamon.mint-themes
  ];

  programs.thunar.plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];

  # environment.pathsToLink = [ "/share" ];

  programs.nm-applet.enable = true;
  programs.nm-applet.indicator = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable  = true;
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
        xfce4-screensaver = psuper.xfce4-screensaver.overrideAttrs (oldAttrs: {
          patches = (oldAttrs.patches or [ ]) ++ [
            ../patches/xfce4-screensaver-mega.patch
          ];
        });
      });
    })
  ];
}
