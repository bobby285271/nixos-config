{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    desktopManager.pantheon = {
      enable = true;
      debug = true;
      extraSwitchboardPlugs = [ pkgs.pantheon-tweaks ];
    };
  };

  services.xserver.desktopManager.pantheon.extraGSettingsOverrides = ''
    # These paths are supposed to refer to gnome-backgrounds
    # but since we do not use FHS, they are broken.
    # And we do not want to hardcode the correct paths
    # since then every GTK app would pull in gnome-backgrounds.
    # Let’s just override the broken paths so that people are not confused.
    [org.gnome.desktop.background]
    picture-uri-dark='''
  '';
}
