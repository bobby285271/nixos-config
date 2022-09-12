{ pkgs, ... }:

{
  services = {
    packagekit.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.cinnamon.enable = true;
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
    })
  ];
}
