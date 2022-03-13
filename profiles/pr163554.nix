{ pkgs, ... }:

{
  imports = [
    ../desktop/fonts.nix
    ../desktop/pantheon.nix
    ../machines/inspiron
    ../programs
    ../system
    ../users/bobby285271
  ];

  environment.systemPackages = with pkgs; [
    firefox
  ];
}
