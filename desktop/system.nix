{ config, pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "ys";
        plugins = [ "git" "python" "man" ];
      };
    };
    thefuck.enable = true;
    bash.enableCompletion = true;
  };

  environment = {
    shells = [ pkgs.bashInteractive pkgs.zsh ];
    shellInit = ''
      export GPG_TTY="$(tty)"
    '';
  };
  
  users.defaultUserShell = pkgs.zsh;

  services.tlp.enable = true;

  system = {
    autoUpgrade.enable = true;
    stateVersion = "21.11";
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
}
