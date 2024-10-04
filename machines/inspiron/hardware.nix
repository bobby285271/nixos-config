{
  config,
  lib,
  modulesPath,
  ...
}:

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
      device = "/dev/disk/by-uuid/d094ad99-0754-413e-9f4b-47153bc9775b";
      fsType = "btrfs";
      options = [
        "subvol=@"
        "compress=zstd"
      ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/d094ad99-0754-413e-9f4b-47153bc9775b";
      fsType = "btrfs";
      options = [
        "subvol=@home"
        "compress=zstd"
      ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/d094ad99-0754-413e-9f4b-47153bc9775b";
      fsType = "btrfs";
      options = [
        "subvol=@nix"
        "compress=zstd"
        "noatime"
      ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/761F-0A47";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  };

  # swapDevices = [ { device = "/dev/disk/by-uuid/40b4055b-f484-4550-87fe-442bac5f5176"; } ];

  networking.useDHCP = lib.mkDefault true;
  # powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = true;
}
