{ python3
, lib
, fetchFromGitHub
, intltool
, glib
, gobject-introspection
, xvfb-run
, wrapGAppsHook
, gtk3
, mate
}:

python3.pkgs.buildPythonApplication rec {
  pname = "mate-menu";
  version = "22.04.2";

  src = fetchFromGitHub {
    owner = "ubuntu-mate";
    repo = pname;
    rev = version;
    hash = "sha256-oeUAoeZppwIaa2Lfi9qkVbMHP/kJjiPUXlvoKAlsefo=";
  };

  nativeBuildInputs = [
    intltool
    glib
    gobject-introspection
    xvfb-run
    wrapGAppsHook
  ];

  buildInputs = [
    gtk3
    mate.mate-menus
    mate.mate-panel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    configobj
    distutils_extra
    pygobject3
    pyxdg
    setproctitle
    xlib
  ];

  postPatch =
    # mate-menu hardcodes absolute paths everywhere. Nuke from orbit.
    let
      replaceAll = x: y: ''
        for file in $(grep -rl "${x}"); do
          substituteInPlace $file --replace "${x}" "${y}"
        done
      '';
    in
    # For translations.
    replaceAll "/usr/share/locale" "$out/share/locale"
    # For mate-menu.py and mate-menu-config.py.
    + replaceAll "/usr/lib/mate-menu" "$out/lib/mate-menu"
    + replaceAll "'/','usr','lib','mate-menu'" "'$out','lib','mate-menu'"
    + ''
      substituteInPlace lib/mate-menu.py --replace '"/", "usr", "lib", "mate-menu"' '"${placeholder "out"}", "lib", "mate-menu"'
    ''
    # For glade files and search suggestion icons.
    + replaceAll "/usr/share/mate-menu" "$out/share/mate-menu"
    + replaceAll "'/', 'usr', 'share', 'mate-menu'" "'$out', 'share', 'mate-menu'"
    + replaceAll "'/','usr','share','mate-menu'" "'$out','share','mate-menu'"
    # For desktop entries.
    + replaceAll "/usr/share/applications" "/run/current-system/sw/share/applications"
    # For editProcess.
    + replaceAll "/usr/bin/mate-desktop-item-edit" "${mate.mate-panel}/bin/mate-desktop-item-edit";

  postInstall = ''
    glib-compile-schemas $out/share/glib-2.0/schemas

    # The latter directly calls the former. We prefer the properly wrapped one.
    substituteInPlace $out/share/dbus-1/services/org.mate.panel.applet.MateMenuAppletFactory.service \
      $out/share/mate-panel/applets/org.mate.panel.MateMenuApplet.mate-panel-applet \
      --replace "$out/lib/mate-menu/mate-menu.py" "$out/bin/mate-menu"
  '';

  dontWrapGApps = true;

  preFixup = ''
    buildPythonPath "$out $propagatedBuildInputs"
    patchPythonScript "$out/lib/mate-menu/mate-menu.py"
    patchPythonScript "$out/lib/mate-menu/mate-menu-config.py"

    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';

  checkPhase = ''
    runHook preCheck

    HOME=$TMPDIR xvfb-run -s '-screen 0 800x600x24' ${python3.interpreter} nix_run_setup test

    runHook postCheck
  '';

  pythonImportsCheck = [ "mate_menu" ];

  meta = with lib; {
    description = "Advanced menu for the MATE desktop, fork of MintMenu";
    homepage = "https://github.com/ubuntu-mate/mate-menu";
    changelog = "https://github.com/ubuntu-mate/mate-menu/releases/tag/${version}";
    license = licenses.gpl2Plus;
    platforms = platforms.linux;
    maintainers = [ ];
  };
}