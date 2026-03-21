{ pkgs, ... }:

{
  services = {

    # samba = {
    #   enable = true;
    #   nmbd.enable = false;
    #   package = pkgs.sambaFull;
    #   openFirewall = true;
    #   settings = {
    #     global = {
    #       "usershare path" = "/public";
    #       "usershare max shares" = "100";
    #       "usershare allow guests" = "yes";
    #       "usershare owner only" = "yes";
    #       "disable netbios" = "yes";
    #       "smb ports" = "445";
    #       "guest account" = "nobody";
    #       "map to guest" = "Bad User";
    #     };

    #     # media = {
    #     #   "path" = "/opt/media";
    #     #   "read only" = false;
    #     #   "browseable" = "yes";
    #     #   "guest ok" = "yes";
    #     #   "valid users" = "admin";
    #     #   "force user" = "jellyfin";
    #     # };
    #   };
    # };
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.xfce = {
        enable = true;
        enableWaylandSession = true;
      };
      # displayManager.startx.enable = true;
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

    systemPackages = with pkgs; [
      networkmanagerapplet
      greybird
      elementary-xfce-icon-theme
      # qogir-theme
      # qogir-icon-theme
      xfce4-clipman-plugin
      xfce4-pulseaudio-plugin
      xfce4-whiskermenu-plugin
      engrampa
      # xapp
      # file
      # xfce.xfmpc
      vala-language-server
      wlr-randr
    ];
  };

  programs = {
    thunar.plugins = with pkgs; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-vcs-plugin
      thunar-volman
      # thunar-shares-plugin
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
      # xfce = super.xfce.overrideScope (
      #   pself: psuper: {
      #     xfwm4 = psuper.xfwm4.overrideAttrs (oldAttrs: {
      #       patches = (oldAttrs.patches or [ ]) ++ [
      #         # https://gitlab.xfce.org/xfce/xfwm4/-/merge_requests/27
      #         ../patches/xfwm4-title-center.patch
      #       ];
      #     });
      #     # xfce4-screensaver = psuper.xfce4-screensaver.overrideAttrs (oldAttrs: {
      #     #   patches = (oldAttrs.patches or [ ]) ++ [
      #     #     ../patches/xfce4-screensaver-wallpaper.patch
      #     #   ];
      #     # });
      #   }
      # );
      xfwm4 = super.xfwm4.overrideAttrs (oldAttrs: {
        patches = (oldAttrs.patches or [ ]) ++ [
          # https://gitlab.xfce.org/xfce/xfwm4/-/merge_requests/27
          ../patches/xfwm4-title-center.patch
        ];
      });
    })
  ];
}
