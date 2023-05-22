{ pkgs, ... }:

{
  environment.sessionVariables."G_SLICE" = "always-malloc";

  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.budgie = {
        enable = true;
        extraPlugins = [
          # pkgs.budgie.budgie-analogue-clock-applet
        ];
        extraGSettingsOverrides = ''
          [org.gnome.desktop.interface:Budgie]
          gtk-theme="Orchis"
          icon-theme="Tela"
          cursor-theme="Adwaita"
        '';
      };
      displayManager = {
        lightdm.greeters.slick = {
          enable = true;
          theme.name = "Orchis";
          iconTheme.name = "Tela";
          draw-user-backgrounds = true;
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
      orchis-theme
      tela-icon-theme
    ];
    budgie.excludePackages = [ pkgs.mate.mate-terminal ];
  };

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
    })
  ];

  # system.replaceRuntimeDependencies =
  # let
  #   gtk4-10-3 = pkgs.gtk4.overrideAttrs (oldAttrs: {
  #     patches = (oldAttrs.patches or [ ]) ++ [
  #       (pkgs.fetchpatch2 {
  #         url = "https://gitlab.gnome.org/GNOME/gtk/-/commit/4f47683710bbb4b56c286c6ee6a5c394fcf2b755.patch";
  #         sha256 = "fU9SX8MH37ZN6Ffk/YhYmipTC7+uT9JXnWggArWNkqA=";
  #       })
  #       (pkgs.fetchpatch2 {
  #         url = "https://gitlab.gnome.org/GNOME/gtk/-/commit/b686ce1cb62dba505120e0f1116c516662a06e30.patch";
  #         sha256 = "0zjY5s+T4CVe3WiowgWE58ruVvqBFUuY2juwBOzMRN4=";
  #       })
  #     ];
  #   });
  # in
  # (builtins.map
  #   (output: {
  #     original = pkgs.gtk4.${output};
  #     replacement = gtk4-10-3.${output};
  #   }) [ "out" /* "dev" "devdoc" */ ]);
}
