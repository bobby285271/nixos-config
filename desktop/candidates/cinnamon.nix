{ pkgs, lib, ... }:

{
  # Debug use only.
  environment.sessionVariables."G_SLICE" = "always-malloc";

  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.cinnamon.enable = true;
      displayManager.lightdm = {
        background = "/var/lib/wallpaper/bobby285271/current.jpg";
        greeters.slick = {
          # theme.name = "Mint-Y-Sand";
          # iconTheme.name = "Mint-Y-Sand";
          draw-user-backgrounds = true;
        };
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
      # gnome = super.gnome.overrideScope (pself: psuper: {
      #   gnome-terminal = psuper.gnome-terminal.overrideAttrs (oldAttrs: {
      #     patches = (oldAttrs.patches or [ ]) ++ [
      #       # Restore transparency
      #       # https://git.launchpad.net/ubuntu/+source/gnome-terminal/refs/
      #       (super.fetchpatch {
      #         url = "https://git.launchpad.net/ubuntu/+source/gnome-terminal/plain/debian/patches/0001-Restore-transparency.patch?h=import/3.44.1-1ubuntu1";
      #         hash = "sha256-WjQd+IFu0dj1dqoKByWpi9hQFek73ae0NCuwm9YRm4o=";
      #       })
      #     ];
      #   });
      # });

      # python310 = super.python310.override {
      #   packageOverrides = pyself: pysuper: {
      #     pygobject3 = pysuper.pygobject3.overrideAttrs (_: {
      #       src = pkgs.fetchFromGitLab {
      #         domain = "gitlab.gnome.org";
      #         owner = "GNOME";
      #         repo = "pygobject";
      #         rev = "3.46.0";
      #         sha256 = "sha256-WdUmi5gZcHz+y10kxVSlefj5VlyIv7K8KpILZFiE+FY=";
      #       };
      #     });
      #   };
      # };

      # cinnamon = super.cinnamon.overrideScope (pself: psuper: {
      #   nemo-with-extensions = psuper.nemo-with-extensions.override { useDefaultExtensions = false; };
      # });
    })
  ];

  # system.replaceRuntimeDependencies =
  #   let
  #     pygobject3 = pkgs.python310.pkgs.pygobject3.overrideAttrs (_: {
  #       src = pkgs.fetchFromGitLab {
  #         domain = "gitlab.gnome.org";
  #         owner = "GNOME";
  #         repo = "pygobject";
  #         rev = "fbbeb9d92bf98f21b5f419a182079a007e6ee6b6";
  #         sha256 = "sha256-dh0BdNaAS1pZj6fkVmS9lIplJenTDrzY8apM3PlW0E4=";
  #       };
  #     });
  #   in
  #   (
  #     (builtins.map
  #       (output: {
  #         original = pkgs.python310.pkgs.pygobject3.${output};
  #         replacement = pygobject3.${output};
  #       }) [ "out" "dev" ])
  #   );

  services.geoclue2.enable = true;

  environment.systemPackages = with pkgs; [
    # colloid-gtk-theme
    # colloid-icon-theme
  ];
}
