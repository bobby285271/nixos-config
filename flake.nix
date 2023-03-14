{
  description = "nixos-bobby285271";

  inputs.nixpkgs.url = "git+file:///home/bobby285271/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = import ./profiles.nix {
        inherit inputs system;
      };
      # nix build '/path/to/flake#iso'
      # Takes ~1h to build on my laptop
      legacyPackages.${system} = {
        iso = self.nixosConfigurations.iso.config.system.build.isoImage;
      };
    };
}
