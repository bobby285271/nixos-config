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
      git fetch ssh://git@ssh.github.com:443/nixos/nixpkgs pull/''${1}/head
      git checkout FETCH_HEAD
    '')
    (pkgs.writeShellScriptBin "nonemast.sh" ''
      nix run /home/bobby285271/nonemast --override-input nixpkgs \
        'git+file:///home/bobby285271/nixpkgs?ref=nixos-unstable' -- "$@"
    '')
  ] ++ (map
    (desktop: pkgs.writeShellScriptBin "nixos-${desktop}.sh" ''
      /home/bobby285271/nixos/helper/__internal-update-common.sh "inspiron-${desktop}" "$@"
    '')
    desktops);
}
