{ pkgs, ... }:

{
  services = {
    greetd = {
      enable = true;
      settings.default_session.command = "${pkgs.cage}/bin/cage -s -- sh -c 'wlr-randr --output eDP-1 --scale 2 && GTK_THEME=Qogir-Dark ${pkgs.gtkgreet}/bin/gtkgreet'";
    };

    xserver = {
      enable = true;
      displayManager.startx.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };

  environment = {
    etc = {
      "X11/xinit/xinitrc".source = pkgs.writeShellScript "xinitrc" ''
        if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
          eval $(dbus-launch --exit-with-session --sh-syntax)
        fi
        systemctl --user import-environment DISPLAY XAUTHORITY

        if command -v dbus-update-activation-environment >/dev/null 2>&1; then
          dbus-update-activation-environment DISPLAY XAUTHORITY
        fi
        systemctl --user start nixos-fake-graphical-session.target

        ${pkgs.runtimeShell} ${pkgs.xfce4-session.xinitrc} &
        waitPID=$!
        wait $waitPID

        # stop services and all subprocesses
        systemctl --user stop nixos-fake-graphical-session.target
        kill 0
      '';

      "greetd/environments".text = ''
        startx
        startxfce4 --wayland
      '';
    };

    systemPackages = with pkgs; [
      wlr-randr
    ];
  };
}
