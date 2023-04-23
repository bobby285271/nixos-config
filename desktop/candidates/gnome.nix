{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
    flatpak.enable = true;
    fwupd.enable = true;
  };

  programs.gpaste.enable = true;
  xdg.portal.enable = true;

  # system.replaceRuntimeDependencies =
  #   let
  #     gtk4-10-3 = pkgs.gtk4.overrideAttrs (oldAttrs: {
  #       version = "4.10.3";
  #       src = pkgs.fetchurl {
  #         url = "mirror://gnome/sources/gtk/4.10/gtk-4.10.3.tar.xz";
  #         sha256 = "sha256-RUVEGteeN3624KcFAm3HpGiG5GobA020CRKQnagBzqk=";
  #       };
  #     });
  #     libadwaita1-3-2 = pkgs.libadwaita.overrideAttrs (oldAttrs: {
  #       version = "1.3.2";
  #       src = pkgs.fetchFromGitLab {
  #         domain = "gitlab.gnome.org";
  #         owner = "GNOME";
  #         repo = "libadwaita";
  #         rev = "1.3.2";
  #         hash = "sha256-9Qha8xN3lC/t5dQNYPbgMX6HAKgEk80pyycrd5MGYLo=";
  #       };
  #     });
  #   in
  #   (builtins.map
  #     (output: {
  #       original = pkgs.gtk4.${output};
  #       replacement = gtk4-10-3.${output};
  #     }) [ "out" /* "dev" "devdoc" */ ])
  #   ++ (builtins.map
  #     (output: {
  #       original = pkgs.libadwaita.${output};
  #       replacement = libadwaita1-3-2.${output};
  #     }) [ "out" /* "dev" "devdoc" */ ]);
}
