{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [ pkgs.libsForQt5.fcitx5-chinese-addons ];
    # fcitx5.addons = [ pkgs.fcitx5-chinese-addons ];
  };
}
