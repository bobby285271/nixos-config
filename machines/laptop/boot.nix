{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxKernel.packages.linux_6_5;
    # plymouth.enable = true;
    loader = {
      timeout = 10;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
        consoleMode = "max";
      };
    };
    extraModprobeConfig = ''
      blacklist nouveau
      options nouveau modeset=0
    '';
    blacklistedKernelModules = [
      "nouveau"
      "nvidia"
      "nvidia_drm"
      "nvidia_modeset"
    ];
  };

  services.udev.extraRules = ''
    # Remove NVIDIA USB xHCI Host Controller devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"

    # Remove NVIDIA USB Type-C UCSI devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"

    # Remove NVIDIA Audio devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"

    # Remove NVIDIA VGA/3D controller devices
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
  '';

  # services.xserver.videoDrivers = [ "nvidia" ];

  # hardware.nvidia = {
  #   open = false;
  #   prime = {
  #     offload = {
  #       enable = true;
  #       enableOffloadCmd = true;
  #     };
  #     intelBusId = "PCI:0:2:0";
  #     nvidiaBusId = "PCI:1:0:0";
  #   };
  # };

  networking.hostName = "thinkbook";
  zramSwap.enable = true;

  environment.variables."NIXPKGS_NO_GC_PATH" = [
    # "${pkgs.linuxPackages_latest.nvidia_x11.src}"
    # "${pkgs.linuxKernel.packages.linux_6_5.nvidia_x11.src}"
  ];
}
