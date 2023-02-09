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
        extraWingpanelIndicators = [ pkgs.wingpanel-indicator-ayatana ];
      };
    };
    flatpak.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = [ pkgs.indicator-application-gtk3 ];

  systemd.user.services.indicator-application = {
    description = "Indicator Application Service";
    serviceConfig = {
      ExecStart = "${pkgs.indicator-application-gtk3}/libexec/indicator-application/indicator-application-service";
      Restart = "on-failure";
    };
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
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
