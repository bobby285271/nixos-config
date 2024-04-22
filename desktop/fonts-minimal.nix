{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    wqy_microhei
    wqy_zenhei
  ];
}
