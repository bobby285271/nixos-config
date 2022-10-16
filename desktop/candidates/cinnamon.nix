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

        cinnamon-common = psuper.cinnamon-common.overrideAttrs (oldAttrs: {
          src = super.fetchFromGitHub {
            githubBase = "hub.fgit.ml";
            owner = "linuxmint";
            repo = "cinnamon";
            rev = "24d660af46ed3b7cdef9980f5991de466645a8e6";
            sha256 = "sha256-6jJEqv8elplh0inH9ncroNTlGRI0bWJlnnG2/pYfHjo=";
          };

          prePatch = ''
            substituteInPlace js/ui/panel.js --replace \
              "Main.restartCinnamon(true);" "// Main.restartCinnamon(true);"
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
