{
  description = "nixos-bobby285271";

  inputs.nixpkgs.url = "git+file:///home/bobby285271/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations = {
      inspiron = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./profiles/inspiron-pantheon.nix ];
      };
      inspiron-cinnamon = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./profiles/inspiron-cinnamon.nix ];
      };
    };
  };
}
