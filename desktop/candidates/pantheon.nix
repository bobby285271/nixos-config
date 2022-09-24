{ pkgs, ... }:

{
  services = {
    packagekit.enable = true;
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
          # We do this for some well-known reasons (TM)
          prePatch = ''
            substituteInPlace src/MessageList/GravatarIcon.vala \
              --replace "https://secure.gravatar.com/avatar/" "https://gravatar.loli.net/avatar/"
          '';
        });

        elementary-terminal = psuper.elementary-terminal.overrideAttrs (oldAttrs: {
          patches = (oldAttrs.patches or [ ]) ++ [
            # Fix weird font color
            # https://github.com/elementary/terminal/pull/684
            (super.fetchpatch {
              url = "https://hub.fgit.ml/elementary/terminal/commit/c0c6ce352f9e25ea559bd98c1ca51a9771f58868.patch";
              hash = "sha256-Yurlm5qGI2k1oRp9IGKtkqNiZmq1T5QIIBy8mCZ/gRw=";
            })
          ];
        });

        wingpanel = psuper.wingpanel.overrideAttrs (oldAttrs: {
          # I prefer this, I don't care
          prePatch = ''
            substituteInPlace wingpanel-interface/BackgroundManager.vala \
              --replace "new_state = BackgroundState.TRANSLUCENT_DARK;" "new_state = BackgroundState.TRANSLUCENT_LIGHT;"
          '';
        });
      });
    })
  ];
}
