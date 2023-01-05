{ inputs, system, ... }:

let
  specialArgs = { inherit inputs system; };

  sharedModules = [
    ./desktop
    ./machines/inspiron
    ./programs
    ./system
    ./users/bobby285271
  ];
in
{
  inspiron = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/pantheon.nix
    ] ++ sharedModules;
  };
  inspiron-cinnamon = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/cinnamon.nix
    ] ++ sharedModules;
  };
  inspiron-gnome = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/gnome.nix
    ] ++ sharedModules;
  };
  inspiron-mate = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/mate.nix
    ] ++ sharedModules;
  };
}
