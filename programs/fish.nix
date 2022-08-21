{ pkgs, ... }:

{
  programs = {
    fish.enable = true;
    thefuck.enable = true;
    bash.enableCompletion = true;
  };

  environment = {
    shells = [ pkgs.bashInteractive pkgs.fish ];
    shellInit = ''
      export GPG_TTY="$(tty)"
    '';
  };

  users.defaultUserShell = pkgs.fish;
}
