{ pkgs, ... }:

{

  services.gnome = {
    gnome-keyring.enable = true;
    gcr-ssh-agent.enable = true;
  };

  programs.seahorse.enable = true;

  environment = {
    etc."environment.d/61-gcr-ssh-agent.conf".source = pkgs.writeText "61-gcr-ssh-agent.conf" ''
      SSH_AUTH_SOCK="''${XDG_RUNTIME_DIR}/gcr/ssh"
    '';
    extraInit = ''
      export SSH_AUTH_SOCK="''${XDG_RUNTIME_DIR}/gcr/ssh"
    '';
  };
}
