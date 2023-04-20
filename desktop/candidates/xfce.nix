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
  ];

  services.gnome.gnome-keyring.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      xfce = super.xfce.overrideScope (pself: psuper: {
        xfwm4 = psuper.xfwm4.overrideAttrs (oldAttrs: {
          prePatch = ''
            # https://gitlab.xfce.org/xfce/xfwm4/-/merge_requests/27/diffs
            substituteInPlace src/frame.c \
              --replace "(w3 / 2) - (logical_rect.width / 2)" "(width / 2) - (logical_rect.width / 2) - left" \
              --replace "left + ((right - left) / 2) - (w3 / 2) - w2" "(width / 2) - (logical_rect.width / 2) - w2"
          '';
        });
      });
    })
  ];
}
