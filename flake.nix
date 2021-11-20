{
  description = "nixos-bobby285271";

  # Use the following when preparing Pantheon updates:
  # nix flake update --override-input nixpkgs path:/home/bobby285271/nixpkgs
  inputs.nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixos-unstable";

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      inspiron = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./profiles/inspiron.nix ];
      };
    };
  };
}
