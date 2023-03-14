{ pkgs, modulesPath, ... }:

{
  imports = [ "${modulesPath}/installer/cd-dvd/installation-cd-graphical-base.nix" ];

  users.users.nixos.password = "nixos";

  services.xserver.displayManager.lightdm.extraConfig = ''
    [SeatDefaults]
    autologin-user=nixos
  '';
}
