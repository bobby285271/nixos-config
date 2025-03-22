{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.gnome = {
        enable = true;
        flashback.enableMetacity = true;
      };
      displayManager.gdm.enable = true;
    };
    flatpak.enable = true;
    fwupd.enable = true;
  };

  # programs.gnome-terminal.enable = true;
  # services.telepathy.enable = true;

  # xdg.portal.config = {
  #   gnome = {
  #     "default" = [ "gnome" "gtk" ];
  #   };
  #   x-cinnamon = {
  #     "default" = [ "xapp" "gtk" ];
  #   };
  #   pantheon = {
  #     "default" = [ "pantheon" "gtk" ];
  #     "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
  #   };
  #   common = {
  #     "default" = [ "gtk" ];
  #   };
  # };

  # programs.gpaste.enable = true;
  xdg.portal.enable = true;

  # system.replaceDependencies.replacements =
  #   let
  #     cairo = pkgs.callPackage ./cairo.nix { };
  #   in
  #   (
  #     (builtins.map
  #       (output: {
  #         original = pkgs.cairo.${output};
  #         replacement = cairo.${output};
  #       }) [ "out" "dev" ])
  #   );
}
