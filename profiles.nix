{ inputs, system, ... }:

let
  specialArgs = { inherit inputs system; };

  sharedModules = [
    ./desktop
    ./system
  ];
  inspironSharedModules = sharedModules ++ [
    ./machines/inspiron
    ./users/bobby285271
    ./users/misc
  ];
  # Randomly chosen but I want one
  # https://github.com/NixOS/nixpkgs/blob/23.11/pkgs/os-specific/linux/nixos-rebuild/nixos-rebuild.sh#L359
  oneOfTheDesktopsBobbyUses = [ ./desktop/candidates/xfce.nix ];
in
{
  inspiron-cinnamon = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/cinnamon.nix
    ] ++ inspironSharedModules;
  };
  inspiron-pantheon = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/pantheon.nix
    ] ++ inspironSharedModules;
  };
  inspiron-mate = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/mate.nix
    ] ++ inspironSharedModules;
  };
  inspiron-gnome = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/gnome.nix
    ] ++ inspironSharedModules;
  };
  inspiron-budgie = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/budgie.nix
    ] ++ inspironSharedModules;
  };
  inspiron-xfce = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/xfce.nix
    ] ++ inspironSharedModules;
  };
  inspiron = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = oneOfTheDesktopsBobbyUses ++ inspironSharedModules;
  };
  iso = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./machines/iso
    ] ++ oneOfTheDesktopsBobbyUses ++ sharedModules;
  };
}
