{
  networking.hostName = "inspiron";

  services = {
    power-profiles-daemon.enable = false;
    tlp.enable = true;
  };

  security.sudo.extraRules = [{
    users = [ "bobby285271" ];
    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" ];
    }];
  }];
}
