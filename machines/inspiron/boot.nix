{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    plymouth.enable = false;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.prime = {
    offload.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
