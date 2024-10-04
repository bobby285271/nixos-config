{ inputs, system, ... }:

let
  specialArgs = {
    inherit inputs system;
  };

  sharedModules = [
    ./desktop
    ./system
  ];
  laptopSharedModules = sharedModules ++ [
    ./machines/laptop
    ./users/bobby285271
    ./users/misc
  ];
  # https://github.com/NixOS/nixpkgs/blob/23.11/pkgs/os-specific/linux/nixos-rebuild/nixos-rebuild.sh#L359
  oneOfTheDesktopsBobbyUses = [ ./desktop/candidates/xfce.nix ];
in
{
  laptop-cinnamon = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ./desktop/candidates/cinnamon.nix ] ++ laptopSharedModules;
  };
  laptop-pantheon = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ./desktop/candidates/pantheon.nix ] ++ laptopSharedModules;
  };
  laptop-mate = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ./desktop/candidates/mate.nix ] ++ laptopSharedModules;
  };
  laptop-gnome = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ./desktop/candidates/gnome.nix ] ++ laptopSharedModules;
  };
  laptop-budgie = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ./desktop/candidates/budgie.nix ] ++ laptopSharedModules;
  };
  laptop-xfce = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ./desktop/candidates/xfce.nix ] ++ laptopSharedModules;
  };
  laptop-labwc = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ./desktop/candidates/labwc.nix ] ++ laptopSharedModules;
  };
  thinkbook = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = oneOfTheDesktopsBobbyUses ++ laptopSharedModules;
  };
  iso = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ./machines/iso ] ++ oneOfTheDesktopsBobbyUses ++ sharedModules;
  };
}
