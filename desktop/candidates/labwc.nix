{ pkgs, ... }:

{
  programs.labwc.enable = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    labwc-tweaks
    labwc-gtktheme
    labwc-menu-generator
    waybar
    mako
    swayidle
    swaylock
    kanshi
  ];
}
