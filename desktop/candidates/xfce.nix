{ pkgs, ... }:

let
  lightdm-scale-wrapper = pkgs.writeShellScript "lightdm-scale-wrapper" ''
    export GDK_SCALE=2
    export GDK_DPI_SCALE=1
    exec $@
  '';
in

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.xfce = {
        enable = true;
        enableWaylandSession = true;
        # waylandSessionCompositor = "wayfire";
      };
      displayManager = {
        lightdm = {
          background = "#202020";
          extraSeatDefaults = ''
            greeter-wrapper = ${lightdm-scale-wrapper}
          '';
          greeters.gtk = {
            enable = true;
            extraConfig = ''
              user-background = false
              cursor-theme-size = 48
            '';
            theme.name = "Greybird";
            iconTheme.name = "elementary-xfce-hidpi";
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
      pkgs.xdg-desktop-portal-gtk
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
    wayfire = {
      enable = true;
      plugins = with pkgs.wayfirePlugins; [
        wcm
        wayfire-plugins-extra
      ];
    };
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
          xfce4-screensaver = psuper.xfce4-screensaver.overrideAttrs (oldAttrs: {
            patches = (oldAttrs.patches or [ ]) ++ [ ../patches/xfce4-screensaver-mega.patch ];
          });
        }
      );
    })
  ];
}
