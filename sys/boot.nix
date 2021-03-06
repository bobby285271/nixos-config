{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    plymouth.enable = true;
    extraModprobeConfig = ''
      options bbswitch load_state=0 unload_state=1
    '';
    extraModulePackages = [ pkgs.linuxPackages_latest.bbswitch ];
    kernelModules = [ "bbswitch" ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
      };
    };
    blacklistedKernelModules = [
      "nouveau"
      "rivafb"
      "nvidiafb"
      "rivatv"
      "nv"
      "uvcvideo"
    ];
  };
}
