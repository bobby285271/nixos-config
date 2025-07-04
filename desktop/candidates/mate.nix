{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.mate.enableWaylandSession = true;
      displayManager.sddm.enable = true;
    };
    flatpak.enable = true;
    accounts-daemon.enable = true;
    udisks2.enable = true;
  };

  programs.wayfire.plugins = with pkgs.wayfirePlugins; [
    firedecor
    wf-shell
  ];

  nixpkgs.overlays = [
    (self: super: {
      mate = super.mate.overrideScope (
        pself: psuper: {
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
        }
      );
    })
  ];

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

  # system.replaceDependencies.replacements =
  #   let
  #     libxml2_test = pkgs.libxml2.overrideAttrs (_: {
  #       version = "2.13.8";
  #       src = pkgs.fetchurl {
  #         url = "mirror://gnome/sources/libxml2/2.13/libxml2-2.13.8.tar.xz";
  #         hash = "sha256-J3KUyzMRmrcbK8gfL0Rem8lDW4k60VuyzSsOhZoO6Eo=";
  #       };
  #     });
  #   in
  #   (
  #     (builtins.map
  #       (output: {
  #         oldDependency = pkgs.libxml2.${output};
  #         newDependency = libxml2_test.${output};
  #       })
  #       [
  #         "bin"
  #         "dev"
  #         "out"
  #         "devdoc"
  #       ]
  #     )
  #   );

  environment.systemPackages = with pkgs; [
    # elementary-xfce-icon-theme
    networkmanagerapplet
    zenity
    # qogir-icon-theme
    # matcha-gtk-theme
  ];
}
