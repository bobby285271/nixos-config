{ pkgs, ... }:

{
  services = {
    packagekit.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.cinnamon.enable = true;
      displayManager.lightdm.greeters.slick = {
        # theme.name = "Mint-Y";
        # iconTheme.name = "Mint-Y-Dark";
        draw-user-backgrounds = true;
      };
    };
    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  nixpkgs.overlays = [
    (self: super: {
      cinnamon = super.cinnamon.overrideScope' (pself: psuper: {
        nemo = psuper.nemo.overrideAttrs (oldAttrs: {
          # Workaround for duplicate right-click menu items
          # https://github.com/NixOS/nixpkgs/issues/190781
          prePatch = ''
            for f in \
              src/nemo-action-config-widget.c \
              src/nemo-script-config-widget.c \
              libnemo-private/nemo-action-manager.c
            do
              substituteInPlace $f --replace \
                'g_build_filename (data_dirs[i], "nemo", "actions", NULL)' \
                'g_build_filename (NEMO_DATADIR, "actions", NULL)'
            done
          '';
        });
      });
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
    })
  ];
}
