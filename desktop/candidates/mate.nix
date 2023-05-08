{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.mate.enable = true;
      displayManager.lightdm.greeters.slick = {
        enable = true;
        theme.name = "vimix-dark-doder";
        iconTheme.name = "Papirus-Dark";
        draw-user-backgrounds = true;
      };
    };
    flatpak.enable = true;
    accounts-daemon.enable = true;
  };

  nixpkgs.overlays = [
    (self: super: {
      mate = super.mate.overrideScope' (pself: psuper: {
        # mate-terminal = psuper.mate-terminal.overrideAttrs (oldAttrs: {
        #   patches = (oldAttrs.patches or [ ]) ++ [
        #     # Dark style
        #     (super.fetchurl {
        #       url = "https://jihulab.com/bobby285271/mate-patches/-/raw/8b43598992aa452dc9045fe4d6bb959a06a8bdbb/mate-terminal-dark-style.patch";
        #       sha256 = "1dj73in8bh90kwcd25hdizbwhljsq9i3g5zzj0iybw59lkvzfkjv";
        #     })
        #   ];
        # });

        # mate-control-center = psuper.mate-control-center.overrideAttrs (oldAttrs: {
        #   patches = (oldAttrs.patches or [ ]) ++ [
        #     # Mint theme support
        #     (super.fetchurl {
        #       url = "https://jihulab.com/bobby285271/mate-patches/-/raw/8b43598992aa452dc9045fe4d6bb959a06a8bdbb/mate-control-center-metacity-3-support.patch";
        #       sha256 = "1nhqa3q53af4fnv8ya5ffa20i9z543av4q86y7ak7f462rgga3zp";
        #     })
        #   ];
        # });
      });
    })
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    vimix-gtk-themes
    networkmanagerapplet
    gnome.zenity
  ];
}
