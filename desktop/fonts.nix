{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Hack"
          "Source Han Mono SC"
        ];
        sansSerif = [
          "Inter"
          "Liberation Sans"
          "Source Han Sans SC"
        ];
        serif = [
          "Liberation Serif"
          "Source Han Serif SC"
        ];
      };
    };
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      hack-font
      inter
      liberation_ttf
      # noto-fonts-emoji
      noto-fonts-color-emoji
      roboto
      # sarasa-gothic
      source-han-mono
      source-han-sans
      source-han-serif
    ];
  };
}
