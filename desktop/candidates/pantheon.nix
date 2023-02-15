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
        elementary-notifications = psuper.elementary-notifications.overrideAttrs (oldAttrs: {
          # I prefer the bubbles never automatically disappear.
          prePatch = ''
            substituteInPlace src/Bubble.vala \
              --replace "start_timeout" "// start_timeout"
          '';
        });

        elementary-mail = psuper.elementary-mail.overrideAttrs (oldAttrs: {
          # I do this for some well-known reasons (TM)
          prePatch = ''
            substituteInPlace src/MessageList/GravatarIcon.vala \
              --replace "https://secure.gravatar.com/avatar/" "https://gravatar.loli.net/avatar/"
          '';

          separateDebugInfo = true;
        });

        elementary-terminal = psuper.elementary-terminal.overrideAttrs (oldAttrs: {
          patches = (oldAttrs.patches or [ ]) ++ [
            # Fix font color
            # https://github.com/elementary/terminal/pull/684
            (super.fetchpatch {
              url = "https://hub.fgit.ml/elementary/terminal/commit/873068fd20098ae0065473ce49c8b768e397091e.patch";
              hash = "sha256-5JJwNp/3GjruNCLtEyAQnqSdIuAjw4fEEwSpXgsTN6I=";
              revert = true;
            })
          ];
        });

        # wingpanel = psuper.wingpanel.overrideAttrs (oldAttrs: {
        #   # I prefer this
        #   prePatch = ''
        #     substituteInPlace wingpanel-interface/BackgroundManager.vala \
        #       --replace "new_state = BackgroundState.TRANSLUCENT_DARK;" "new_state = BackgroundState.TRANSLUCENT_LIGHT;"
        #   '';
        # });
      });
    })
  ];
}
