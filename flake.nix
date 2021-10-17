{
  description = "nixos-bobby285271";

  inputs = {
    # Use the following when preparing Pantheon updates:
    # nix flake update --override-input nixpkgs path:/home/bobby285271/nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
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
