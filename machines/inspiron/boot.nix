{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxKernel.packages.linux_6_1;
    plymouth.enable = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
    };

    extraModprobeConfig = ''
      options bbswitch load_state=0 unload_state=1
    '';
    extraModulePackages = [ pkgs.linuxPackages_latest.bbswitch ];
    kernelModules = [ "bbswitch" ];
    blacklistedKernelModules = [ "nouveau" ];
  };

  environment.variables."NIXPKGS_NO_GC_PATH" = [
    "${pkgs.linuxPackages_latest.nvidia_x11.src}"
  ];
}
