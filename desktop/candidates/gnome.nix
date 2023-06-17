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
  #     gtk3-new = pkgs.gtk3.overrideAttrs (oldAttrs: {
  #       version = "3.24.38";
  #       src = pkgs.fetchurl {
  #         url = "mirror://gnome/sources/gtk+/3.24/gtk+-3.24.38.tar.xz";
  #         sha256 = "sha256-zhHezwGLJb3YUFVEpPhyQoVOyIvgVNmt5fOiBETdjuc=";
  #       };
  #     });
  #     glib-new = pkgs.glib.overrideAttrs (oldAttrs: {
  #       version = "2.76.3";
  #       src = pkgs.fetchurl {
  #         url = "mirror://gnome/sources/glib/2.76/glib-2.76.3.tar.xz";
  #         sha256 = "wL5ETkA9fDGE0fOU+J8LZEcQtekzG1T6TotQN4E60yo=";
  #       };
  #     });
  #     at-spi2-core-new = pkgs.at-spi2-core.overrideAttrs (oldAttrs: {
  #       version = "2.48.3";
  #       src = pkgs.fetchurl {
  #         url = "mirror://gnome/sources/at-spi2-core/2.48/at-spi2-core-2.48.3.tar.xz";
  #         sha256 = "NzFt9DypmJzlOdVM9CmnaMKLs4oLNJUL6t0EIYJ+31U=";
  #       };
  #     });
  #   in
  #   ((builtins.map
  #     (output: {
  #       original = pkgs.gtk3.${output};
  #       replacement = gtk3-new.${output};
  #     }) [ "out" "dev" ]) ++ (builtins.map
  #     (output: {
  #       original = pkgs.glib.${output};
  #       replacement = glib-new.${output};
  #     }) [ "out" "dev" ]) ++ (builtins.map
  #     (output: {
  #       original = pkgs.at-spi2-core.${output};
  #       replacement = at-spi2-core-new.${output};
  #     }) [ "out" "dev" ]));
}
