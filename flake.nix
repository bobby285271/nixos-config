{
  description = "nixos-bobby285271";

  # Use the following when preparing Pantheon updates:
  # nix flake update --override-input nixpkgs path:/home/bobby285271/nixpkgs
  inputs.nixpkgs.url = "git+https://mirrors.nju.edu.cn/git/nixpkgs.git?ref=nixos-unstable-small";

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
