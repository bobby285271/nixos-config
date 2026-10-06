{ config, ... }:

{
  users.users.test = {
    isNormalUser = true;
    hashedPassword = "$6$0MOOo3w4xnwaTK07$us6355WMS/QG.TDsY1qfiK3vhSEQo1pfsx0xEWzLMD/9A/mOty889pr5XGFGYOeJoNbVLCk/DgBxq7g5JPJsh1";
    home = "/home/test";
    description = "Test User";
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "podman"
      "audio"
      "sound"
      "video"
      "networkmanager"
      "input"
      "tty"
      "camera"
      "pipewire"
      "sambashare"
    ];
  };

  security.sudo.extraRules = [
    {
      users = [ "test" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
