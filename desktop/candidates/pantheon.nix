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

  environment.pantheon.excludePackages = [
    # pkgs.xdg-desktop-portal-gtk
    # pkgs.pantheon.elementary-files
    # pkgs.pantheon.elementary-settings-daemon
    pkgs.pantheon.xdg-desktop-portal-pantheon
  ];

  environment.systemPackages = with pkgs; [
    pantheon-tweaks
    monitor
  ];

  xdg.portal = {
    enable = true;
    # extraPortals = [
    #   (pkgs.xdg-desktop-portal-gtk.override {
    #     # Use the upstream default so this won't conflict with the pantheon portal.
    #     # buildPortalsInGnome = false;
    #   })
    # ];
  };

  services.xserver.desktopManager.pantheon.extraWingpanelIndicators = with pkgs; [ monitor ];

  systemd.user.services.indicatorapp = {
    description = "indicator-application-gtk3";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.indicator-application-gtk3}/libexec/indicator-application/indicator-application-service";
    };
  };

  # programs.pantheon-tweaks.enable = true;

  # system.replaceDependencies.replacements =
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
              # ../patches/elementary-terminal-ctrl-k.patch
            ];
          });

          wingpanel = psuper.wingpanel.overrideAttrs (oldAttrs: {
            prePatch = ''
              substituteInPlace src/PanelWindow.vala \
                --replace-fail "monitor_dimensions.width /= get_scale_factor ();" "//"
            '';
          });
        }
      );
    })
  ];
}
