{ pkgs, ... }:

{
  programs.labwc.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.xfce = {
      enable = true;
      noDesktop = true;
      enableXfwm = false;
      enableScreensaver = false;
    };
  };

  environment.systemPackages = with pkgs; [
    bemenu
    labwc-tweaks
    labwc-gtktheme
    labwc-menu-generator
    mako
    sfwbar
    swaybg
    swayidle
    swaylock
    kanshi
    xfce.xfce4-terminal
    networkmanagerapplet
    adwaita-icon-theme
    greybird
    elementary-xfce-icon-theme
    glib
  ];
}
