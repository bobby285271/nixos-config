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
      theme = "ys";
      plugins = [ "git" "python" "man" ];
    };
  };

  environment = {
    shells = [ pkgs.bashInteractive pkgs.zsh ];
    shellInit = ''
      export GPG_TTY="$(tty)"
    '';
  };
  
  users.defaultUserShell = pkgs.zsh;
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
