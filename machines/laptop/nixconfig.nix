{
  nix = {
    registry.nixpkgs = {
      from = {
        type = "indirect";
        id = "local";
      };
      to = {
        type = "git";
        ref = "nixos-unstable";
        url = "file:///home/bobby285271/nixpkgs";
      };
    };

    settings.trusted-users = [
      "root"
      "bobby285271"
    ];
  };
}
