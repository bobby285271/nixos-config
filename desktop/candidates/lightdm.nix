{ pkgs, ... }:

let
  lightdm-scale-wrapper = pkgs.writeShellScript "lightdm-scale-wrapper" ''
    export GDK_SCALE=2
    export GDK_DPI_SCALE=1
    exec $@
  '';
in

{
  services = {
    xserver.displayManager = {
      lightdm = {
        background = "#202020";
        extraSeatDefaults = ''
          greeter-wrapper = ${lightdm-scale-wrapper}
        '';
        greeters.gtk = {
          enable = true;
          extraConfig = ''
            user-background = false
            cursor-theme-size = 48
          '';
          theme.name = "Greybird";
          iconTheme.name = "elementary-xfce-hidpi";
          indicators = [
            "~host"
            "~spacer"
            "~session"
            "~language"
            "~a11y"
            "~clock"
            "~power"
          ];
          clock-format = "%a, %b %d, %H:%M";
        };
      };
    };
    displayManager.defaultSession = "xfce";
    flatpak.enable = true;
  };
}
