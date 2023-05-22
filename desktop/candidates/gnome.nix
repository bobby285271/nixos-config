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

  system.replaceRuntimeDependencies =
    let
      gtk4-10-3 = pkgs.gtk4.overrideAttrs (oldAttrs: {
        patches = (oldAttrs.patches or [ ]) ++ [
          (pkgs.fetchpatch2 {
            url = "https://gitlab.gnome.org/GNOME/gtk/-/commit/4f47683710bbb4b56c286c6ee6a5c394fcf2b755.patch";
            sha256 = "fU9SX8MH37ZN6Ffk/YhYmipTC7+uT9JXnWggArWNkqA=";
          })
          (pkgs.fetchpatch2 {
            url = "https://gitlab.gnome.org/GNOME/gtk/-/commit/b686ce1cb62dba505120e0f1116c516662a06e30.patch";
            sha256 = "0zjY5s+T4CVe3WiowgWE58ruVvqBFUuY2juwBOzMRN4=";
          })
        ];
      });
    in
    (builtins.map
      (output: {
        original = pkgs.gtk4.${output};
        replacement = gtk4-10-3.${output};
      }) [ "out" /* "dev" "devdoc" */ ]);
}
