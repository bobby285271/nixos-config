{
  description = "nixos-bobby285271";

  inputs.nixpkgs.url = "git+file:///home/bobby285271/nixpkgs?ref=nixos-unstable";

  # ?
  inputs.budgie.url = "git+file:///home/bobby285271/budgie-nix";
  inputs.budgie.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = import ./profiles.nix {
        inherit inputs system;
      };
    };
}
