{ pkgs, ... }:

{

  services.gnome = {
    gnome-keyring.enable = true;
    gcr-ssh-agent.enable = true;
  };

  programs.seahorse.enable = true;

  # Set SSH_AUTH_SOCK in session environment since not all DEs/display managers will use environment variables from systemd
  environment.extraInit = ''
    if [ -z "$SSH_AUTH_SOCK" ] && [ -n "$XDG_RUNTIME_DIR" ]; then
      export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
    fi
  '';
}
