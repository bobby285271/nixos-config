{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;
    fontconfig = {
      enable = true;
      defaultFonts.emoji = [ "Noto Color Emoji" ];
      defaultFonts.monospace = [ "Hack" "Source Han Mono SC" ];
      defaultFonts.sansSerif = [ "Inter" "Liberation Sans" "Soruce Han Sans SC" ];
      defaultFonts.serif = [ "Liberation Serif" "Source Han Serif SC" ];
    };
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      hack-font
      inter
      liberation_ttf
      noto-fonts-emoji
      roboto
      source-han-mono
      source-han-sans
      source-han-serif
      symbola
      wqy_microhei
      wqy_zenhei
    ];
  };
}
