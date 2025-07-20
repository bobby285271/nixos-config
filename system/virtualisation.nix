{
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
    };
    libvirtd.enable = true;
    containers = {
      enable = true;
      policy = {
        default = [ { type = "insecureAcceptAnything"; } ];
        transports.docker-daemon."" = [ { type = "insecureAcceptAnything"; } ];
      };
    };
  };
}
