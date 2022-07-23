{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.pantheon = {
        enable = true;
        debug = true;
        extraSwitchboardPlugs = [ pkgs.pantheon-tweaks ];
      };
    };
    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  nixpkgs.overlays = [
    (self: super: {
      pantheon = super.pantheon.overrideScope' (pself: psuper: {
        elementary-mail = psuper.elementary-mail.overrideAttrs (oldAttrs: {
          prePatch = ''
            substituteInPlace src/MessageList/GravatarIcon.vala \
              --replace "https://secure.gravatar.com/avatar/" "https://gravatar.loli.net/avatar/"
          '';
        });

        wingpanel = psuper.wingpanel.overrideAttrs (oldAttrs: {
          prePatch = ''
            substituteInPlace wingpanel-interface/BackgroundManager.vala \
              --replace "new_state = BackgroundState.TRANSLUCENT_LIGHT;" "new_state = BackgroundState.TRANSLUCENT_DARK;"
          '';
        });
      });
    })
  ];
}
