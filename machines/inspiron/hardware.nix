{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/7693343f-378a-44f8-b602-f7c50cbf7269";
      fsType = "btrfs";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/E288-231E";
      fsType = "vfat";
    };
  };

  swapDevices = [{
    device = "/dev/disk/by-uuid/7735a559-7cdf-42b6-98f5-d12f300dd180";
  }];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
