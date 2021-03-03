{ config, pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "peepcode";
      plugins = [ "git" "python" "man" "fzf"];
    };
  };
  environment.shells = [ pkgs.bashInteractive pkgs.zsh ];
  programs.thefuck.enable = true;

  services.tlp.enable = true;

  programs.bash.enableCompletion = true;
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  system = {
    autoUpgrade.enable = true;
    stateVersion = "21.05";
  };
}