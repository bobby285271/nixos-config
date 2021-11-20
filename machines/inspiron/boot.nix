{ config, pkgs, ... }:

{
  boot = {
    extraModprobeConfig = ''
      options bbswitch load_state=0 unload_state=1
    '';
    extraModulePackages = [ pkgs.linuxPackages.bbswitch ];
    kernelModules = [ "bbswitch" ];
    blacklistedKernelModules = [ "nouveau" ];
  };
}
