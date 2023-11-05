{ pkgs, lib, ... }:

let
  desktops = [
    "budgie"
    "cinnamon"
    "gnome"
    "mate"
    "pantheon"
    "xfce"
  ];
in
{
  environment.systemPackages = (map
    (desktop: pkgs.writeShellScriptBin "nixos-${desktop}.sh" ''
      /home/bobby285271/nixos/helper/__internal-update-common.sh "inspiron${lib.optionalString (desktop != "cinnamon") "-${desktop}"}" "$@"
    '')
    desktops);
}
