{ pkgs, ... }:

{
  boot = {
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
    extraModulePackages = [ pkgs.linuxPackages.bbswitch ];
    kernelModules = [ "bbswitch" ];
    blacklistedKernelModules = [ "nouveau" ];
  };
}
