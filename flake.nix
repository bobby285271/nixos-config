{
  description = "nixos-bobby285271";

  inputs = {
    nixpkgs.url = "git+https://github.com.cnpmjs.org/NixOS/nixpkgs?ref=nixos-unstable-small";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      inspiron = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./profiles/inspiron.nix ];
      };
      inspiron-light = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./profiles/inspiron-light.nix ];
      };
    };
  };
}
