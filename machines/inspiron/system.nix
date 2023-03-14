{
  networking.hostName = "inspiron";

  security.sudo.extraRules = [{
    users = [ "bobby285271" ];
    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" ];
    }];
  }];
}
