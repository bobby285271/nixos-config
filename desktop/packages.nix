{ config, pkgs, ... }:

let
in
# libreoffice-icon-fixed = pkgs.callPackage ./pkgs/libreoffice-icon-fixed.nix { };
# dingtalk = pkgs.callPackage ./pkgs/dingtalk { };
{
  environment.systemPackages = with pkgs; [
    # chromium
    # terminate called after throwing an instance of 'std::bad_alloc'
    # dingtalk
    # drawing
    # firefox
    # gitg
    gnome-boxes
    libreoffice-fresh
    # slack
    thunderbird
    vscode-fhs
    # vscodium-fhs
    timeshift
  ];

  # system.replaceDependencies.replacements =
  #   let
  #     # Report all the crashes *downstream* https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7836
  #     gtk4-test = pkgs.gtk4.overrideAttrs (oldAttrs: {
  #       patches = (oldAttrs.patches or [ ]) ++ [
  #         (pkgs.fetchpatch {
  #           url = "https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7836.diff";
  #           hash = "sha256-AwsqnjzkHW0qf/7PUUjrUAUIwmbeq2pvoq1LhCu7tw0=";
  #         })
  #       ];
  #     });
  #   in
  #   (builtins.map
  #     (output: {
  #       original = pkgs.gtk4.${output};
  #       replacement = gtk4-test.${output};
  #     })
  #     [
  #       "out"
  #       "dev"
  #       "devdoc"
  #     ]
  #   );
}
