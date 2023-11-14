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
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "review.sh" ''
      cd /home/bobby285271/nixpkgs
      git fetch https://hub.fgit.cf/nixos/nixpkgs pull/''${1}/head
      git checkout FETCH_HEAD
    '')
  ] ++ (map
    (desktop: pkgs.writeShellScriptBin "nixos-${desktop}.sh" ''
      /home/bobby285271/nixos/helper/__internal-update-common.sh "inspiron-${desktop}" "$@"
    '')
    desktops);
}
