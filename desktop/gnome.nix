{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.gnome = {
        enable = true;
        debug = true;
        extraGSettingsOverrides = ''
          [org.gnome.desktop.background]
          picture-uri='file:///thisdoesnotexist.png'
        '';
      };
      displayManager.gdm.enable = true;
    };

    flatpak.enable = true;
  };
}
