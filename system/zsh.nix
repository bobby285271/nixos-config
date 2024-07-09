{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "ys";
        plugins = [
          "git"
          "python"
          "man"
        ];
      };
    };
    # thefuck.enable = true;
    bash.completion.enable = true;
  };

  environment = {
    shells = [ pkgs.bashInteractive pkgs.zsh ];
    shellInit = ''
      export GPG_TTY="$(tty)"
    '';
  };

  users.defaultUserShell = pkgs.zsh;
}
