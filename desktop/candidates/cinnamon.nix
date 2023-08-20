{ pkgs, lib, ... }:

{
  # Debug use only.
  environment.sessionVariables."G_SLICE" = "always-malloc";

  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.cinnamon.enable = true;
      displayManager.lightdm.greeters.slick = {
        theme.name = "Mint-Y-Aqua";
        iconTheme.name = "Mint-Y-Aqua";
        draw-user-backgrounds = true;
      };
    };
    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      (pkgs.xdg-desktop-portal-gtk.override {
        # Use the upstream default so this won't conflict with the xapp portal.
        buildPortalsInGnome = false;
      })
    ];
  };

  services.redshift.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      gnome = super.gnome.overrideScope' (pself: psuper: {
        gnome-terminal = psuper.gnome-terminal.overrideAttrs (oldAttrs: {
          patches = (oldAttrs.patches or [ ]) ++ [
            # Restore transparency
            # https://git.launchpad.net/ubuntu/+source/gnome-terminal/refs/
            (super.fetchpatch {
              url = "https://git.launchpad.net/ubuntu/+source/gnome-terminal/plain/debian/patches/0001-Restore-transparency.patch?h=import/3.44.1-1ubuntu1";
              hash = "sha256-WjQd+IFu0dj1dqoKByWpi9hQFek73ae0NCuwm9YRm4o=";
            })
          ];
        });
      });

      # cinnamon = super.cinnamon.overrideScope' (pself: psuper: {
      #   nemo-with-extensions = psuper.nemo-with-extensions.override { useDefaultExtensions = false; };
      # });
    })
  ];

  environment.systemPackages = with pkgs; [
    # colloid-gtk-theme
    # colloid-icon-theme
  ];
}
