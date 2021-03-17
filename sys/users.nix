{ config, pkgs, ... }:

{
  users.users.bobby285271 = { 
    isNormalUser = true;
    home = "/home/bobby285271";
    description = "Bobby Rong";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  security.sudo.extraRules = [
    {
      users = [ "bobby285271" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}