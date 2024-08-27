{ pkgs, ... }:

{
  programs.labwc.enable = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    bemenu
    labwc-tweaks
    labwc-gtktheme
    labwc-menu-generator
    # waybar
    mako
    sfwbar
    swaybg
    swayidle
    swaylock
    kanshi
    xfce.xfce4-terminal
    networkmanagerapplet
    adwaita-icon-theme
  ];
}
