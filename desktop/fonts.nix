{ pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;
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
    fonts = with pkgs; [
      hack-font
      inter
      liberation_ttf
      noto-fonts-emoji
      roboto
      sarasa-gothic
      source-han-mono
      source-han-sans
      source-han-serif
      symbola
      wqy_microhei
      wqy_zenhei
    ];
  };
}
