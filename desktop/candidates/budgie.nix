{ pkgs, ... }:

{
  environment.sessionVariables."G_SLICE" = "always-malloc";

  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.budgie = {
        enable = true;
        extraPlugins = [
          # pkgs.budgie-analogue-clock-applet
          # pkgs.budgie-user-indicator-redux
          # pkgs.budgie-media-player-applet
          # pkgs.budgie-systemmonitor-applet
        ];
        # extraGSettingsOverrides = ''
        #   [org.gnome.desktop.interface:Budgie]
        #   gtk-theme="Qogir"
        #   # icon-theme="Tela"
        #   # cursor-theme="Adwaita"
        # '';
      };
      displayManager = {
        # sddm.enable = true;

        lightdm = {
          enable = true;
          background = "/var/lib/wallpaper/bobby285271/current.jpg";
          greeters.slick = {
            enable = true;
            theme.name = "Qogir-Dark";
            iconTheme.name = "Qogir";
            cursorTheme.name = "Qogir";
            draw-user-backgrounds = false;
            extraConfig = ''
              enable-hidpi = on
            '';
          };
        };
      };
    };
    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.gnome-terminal.enable = true;

  environment = {
    systemPackages = with pkgs; [
      networkmanagerapplet
      # gtk3.out
      # gtk3
      # wayland
      # glib.out
      # orchis-theme
      # tela-icon-theme
    ];
    budgie.excludePackages = [ pkgs.mate.mate-terminal ];
  };
}
