{
  description = "nixos-bobby285271";

  inputs = {
    # Daily use.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    # Pantheon updates preparation.
    # nixpkgs.url = "path:/home/bobby285271/nixpkgs";
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
