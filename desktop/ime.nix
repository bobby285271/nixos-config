{ pkgs, config, lib, ... }:

let
  preferIbus = config.services.xserver.desktopManager.pantheon.enable ||
    config.services.xserver.desktopManager.gnome.enable;
in
{
  i18n.inputMethod = {
    enabled = if preferIbus then "ibus" else "fcitx5";
    fcitx5 = lib.mkIf (!preferIbus) {
      addons = [ pkgs.fcitx5-chinese-addons ];
    };
    ibus = lib.mkIf preferIbus {
      engines = [ pkgs.ibus-engines.libpinyin ];
    };
  };
}
