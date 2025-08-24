# { pkgs, ... }:
# {
#   i18n.inputMethod = {
#     enable = true;
#     type = "fcitx5";
#     fcitx5.addons = [ pkgs.libsForQt5.fcitx5-chinese-addons ];
#     # fcitx5.addons = [ pkgs.fcitx5-chinese-addons ];
#   };
# }

{
  pkgs,
  config,
  lib,
  ...
}:

let
  preferIbus = config.services.desktopManager.gnome.enable;
in
{
  i18n.inputMethod = {
    enable = true;
    type = if preferIbus then "ibus" else "fcitx5";
    fcitx5 = lib.mkIf (!preferIbus) {
      addons = [ pkgs.fcitx5-chinese-addons ];
    };
    ibus = lib.mkIf preferIbus {
      engines = [ pkgs.ibus-engines.libpinyin ];
    };
  };

  environment.variables = lib.mkIf preferIbus {
    GTK_IM_MODULE = lib.mkForce null;
  };
}
