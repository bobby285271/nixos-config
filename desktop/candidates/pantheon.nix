{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.pantheon = {
        enable = true;
        debug = true;
        # extraSwitchboardPlugs = [ pkgs.pantheon-tweaks ];
      };
    };
    flatpak.enable = true;
  };

  environment.systemPackages = with pkgs; [ pantheon-tweaks ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      (pkgs.xdg-desktop-portal-gtk.override {
        # Use the upstream default so this won't conflict with the pantheon portal.
        # buildPortalsInGnome = false;
      })
    ];
  };

  # services.xserver.desktopManager.pantheon.extraWingpanelIndicators = with pkgs; [ wingpanel-indicator-ayatana ];

  # systemd.user.services.indicatorapp = {
  #   description = "indicator-application-gtk3";
  #   wantedBy = [ "graphical-session.target" ];
  #   partOf = [ "graphical-session.target" ];
  #   serviceConfig = {
  #     ExecStart = "${pkgs.indicator-application-gtk3}/libexec/indicator-application/indicator-application-service";
  #   };
  # };

  # programs.pantheon-tweaks.enable = true;

  # system.replaceRuntimeDependencies =
  #   let
  #     glib = pkgs.glib.overrideAttrs (old: {
  #       mesonFlags = old.mesonFlags ++ [ "-Dglib_debug=disabled" ];
  #     });
  #   in
  #   (
  #     (builtins.map
  #       (output: {
  #         original = pkgs.glib.${output};
  #         replacement = glib.${output};
  #       })
  #       [
  #         "bin"
  #         "out"
  #         "dev"
  #       ]
  #     )
  #   );

  nixpkgs.overlays = [
    (self: super: {
      pantheon = super.pantheon.overrideScope (
        pself: psuper: {
          # elementary-notifications = psuper.elementary-notifications.overrideAttrs (oldAttrs: {
          #   # I prefer the bubbles never automatically disappear.
          #   prePatch = ''
          #     substituteInPlace src/Bubble.vala \
          #       --replace "start_timeout" "// start_timeout"
          #   '';
          # });

          # elementary-mail = psuper.elementary-mail.overrideAttrs (oldAttrs: {
          #   # I do this for some well-known reasons (TM)
          #   prePatch = ''
          #     substituteInPlace src/MessageList/MessageListItem.vala \
          #       --replace "avatar.set_loadable_icon" "// avatar.set_loadable_icon"
          #   '';

          #   separateDebugInfo = true;
          # });

          elementary-terminal = psuper.elementary-terminal.overrideAttrs (oldAttrs: {
            patches = (oldAttrs.patches or [ ]) ++ [
              # Fix font color
              # https://github.com/elementary/terminal/pull/684
              (super.fetchpatch {
                url = "https://github.com/elementary/terminal/commit/873068fd20098ae0065473ce49c8b768e397091e.patch";
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
        }
      );
    })
  ];
}
