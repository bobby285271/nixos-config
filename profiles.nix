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
  xfceModules = [
    ./desktop/candidates/xfce.nix
    ./desktop/candidates/xfce-lightdm.nix
  ];
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
    modules = xfceModules ++ laptopSharedModules;
  };
  laptop-labwc = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ./desktop/candidates/labwc.nix ] ++ laptopSharedModules;
  };
  laptop-lxqt = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ./desktop/candidates/lxqt.nix ] ++ laptopSharedModules;
  };
  thinkbook = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = xfceModules ++ laptopSharedModules;
  };
  iso = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./machines/iso
    ]
    ++ xfceModules
    ++ sharedModules;
  };
}
