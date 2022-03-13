{
  description = "nixos-bobby285271";

  inputs.nixpkgs.url = "git+file:///home/bobby285271/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      inspiron = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./profiles/inspiron.nix ];
      };
      pr163554 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./profiles/pr163554.nix ];
      };
    };
  };
}
