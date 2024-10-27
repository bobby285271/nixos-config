{ pkgs, config, ... }:

let
  lightdm-scale-wrapper = pkgs.writeShellScript "lightdm-scale-wrapper" ''
    export GDK_SCALE=2
    export GDK_DPI_SCALE=1
    exec $@
  '';
in

{
  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = ''
            ${pkgs.greetd.tuigreet}/bin/tuigreet \
              --time \
              --greeting "Ciallo >_<" \
              --remember \
              --remember-user-session \
              --power-shutdown /run/current-system/systemd/bin/systemctl poweroff \
              --power-reboot /run/current-system/systemd/bin/systemctl reboot
          '';
        };
      };
    };
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.xfce.enable = true;
      desktopManager.xfce.enableWaylandSession = true;
      displayManager = {
        startx.enable = true;
        # lightdm = {
        #   background = "/var/lib/wallpaper/bobby285271/current.jpg";
        #   extraSeatDefaults = ''
        #     greeter-wrapper = ${lightdm-scale-wrapper}
        #   '';
        #   greeters.gtk = {
        #     enable = true;
        #     extraConfig = ''
        #       user-background = false
        #       cursor-theme-size = 48
        #     '';
        #     theme.name = "Greybird";
        #     iconTheme.name = "elementary-xfce";
        #     indicators = [
        #       "~host"
        #       "~spacer"
        #       "~session"
        #       "~language"
        #       "~a11y"
        #       "~clock"
        #       "~power"
        #     ];
        #     clock-format = "%a, %b %d, %H:%M";
        #   };
        # };
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

  environment = {
    sessionVariables = {
      QT_SCALE_FACTOR = "2";
      # GDK_DPI_SCALE = "0.5";
      # QT_FONT_DPI = "96";
    };

    systemPackages = with pkgs; [
      networkmanagerapplet
      greetd.tuigreet
      # qogir-theme
      # qogir-icon-theme
      greybird
      elementary-xfce-icon-theme
      xfce.xfce4-clipman-plugin
      xfce.xfce4-pulseaudio-plugin
      xfce.xfce4-whiskermenu-plugin
      mate.engrampa
      # cinnamon.xapp
      # file
      # xfce.xfmpc
      vala-language-server
    ];
  };

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  # environment.pathsToLink = [ "/share" ];

  programs.nm-applet.enable = true;
  programs.nm-applet.indicator = true;

  hardware.bluetooth.enable = true;
  # services.blueman.enable = true;
  services.gnome.gnome-keyring.enable = true;

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
          xfce4-screensaver = psuper.xfce4-screensaver.overrideAttrs (oldAttrs: {
            patches = (oldAttrs.patches or [ ]) ++ [ ../patches/xfce4-screensaver-mega.patch ];
          });
        }
      );
    })
  ];
}
