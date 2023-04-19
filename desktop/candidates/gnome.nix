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
  #     wayland-122 = pkgs.wayland.overrideAttrs (oldAttrs: {
  #       version = "1.22.0";
  #       src = pkgs.fetchurl {
  #         url = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz";
  #         hash = "sha256-FUCvHqaYpHHC2OnSiDMsfg/TYMjx0Sk267fny8JCWEI=";
  #       };
  #     });
  #     mesa-rebuilt = pkgs.mesa.override { wayland = wayland-122; };
  #   in
  #   (builtins.map
  #     (output: {
  #       original = pkgs.wayland.${output};
  #       replacement = wayland-122.${output};
  #     }) [ "out" "bin" "dev" ])
  #   ++ (builtins.map
  #     (output: {
  #       original = pkgs.mesa.${output};
  #       replacement = mesa-rebuilt.${output};
  #     }) [ "out" "dev" "drivers" ]);
}
