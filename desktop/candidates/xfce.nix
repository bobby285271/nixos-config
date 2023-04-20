{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.xfce.enable = true;
      displayManager = {
        lightdm.greeters.gtk = {
          enable = true;
          theme.name = "Greybird";
          iconTheme.name = "elementary-xfce";
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
    greybird
    elementary-xfce-icon-theme
    xfce.xfce4-whiskermenu-plugin
    gnome.file-roller
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
