{ config, pkgs, ... }:

{
  users.users.bobby285271 = { 
    isNormalUser = true;
    hashedPassword = "$6$0MOOo3w4xnwaTK07$us6355WMS/QG.TDsY1qfiK3vhSEQo1pfsx0xEWzLMD/9A/mOty889pr5XGFGYOeJoNbVLCk/DgBxq7g5JPJsh1";
    home = "/home/bobby285271";
    description = "Bobby Rong";
    extraGroups = [ "wheel" "networkmanager" "docker" "audio" "sound" "video" "networkmanager" "input" "tty" ];
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
