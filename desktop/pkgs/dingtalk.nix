{ sources
, stdenv
, autoPatchelfHook
, makeWrapper
, lib
, callPackage
, # DingTalk dependencies
  alsa-lib
, at-spi2-atk
, at-spi2-core
, cairo
, cups
, curl
, dbus
, e2fsprogs
, gdk-pixbuf
, glib
, gnutls
, graphite2
, gtk2
, harfbuzz
, krb5
, libdrm
, libgcrypt
, libGLU
, libinput
, libpulseaudio
, libsForQt5
, libthai
, libxkbcommon
, mesa
, mtdev
, nspr
, nss
, openldap
, pango
, rtmpdump
, udev
, util-linux
, xorg
, ...
} @ args:
################################################################################
# Mostly based on dingtalk-bin package from AUR:
# https://aur.archlinux.org/packages/dingtalk-bin
################################################################################
let
  libraries = [
    alsa-lib
    at-spi2-atk
    at-spi2-core
    cairo
    cups
    curl
    dbus
    e2fsprogs
    gdk-pixbuf
    glib
    gnutls
    graphite2
    (gtk2.override {
      pango = pango.override {
        harfbuzz = callPackage ./harfbuzz {
          ApplicationServices = null;
          CoreText = null;
        };
      };
    })
    krb5
    libdrm
    libgcrypt
    libGLU
    libinput
    libpulseaudio
    libsForQt5.qtbase
    libthai
    libxkbcommon
    mesa.drivers
    mtdev
    nspr
    nss
    openldap
    rtmpdump
    udev
    util-linux
    xorg.libICE
    xorg.libSM
    xorg.libX11
    xorg.libxcb
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXinerama
    xorg.libXmu
    xorg.libXrandr
    xorg.libXrender
    xorg.libXScrnSaver
    xorg.libXt
    xorg.libXtst
    xorg.xcbutilimage
    xorg.xcbutilkeysyms
    xorg.xcbutilrenderutil
    xorg.xcbutilwm
  ];
in
stdenv.mkDerivation rec {
  inherit (sources.dingtalk) pname version src;

  nativeBuildInputs = [ autoPatchelfHook makeWrapper libsForQt5.wrapQtAppsHook ];
  buildInputs = libraries;

  unpackPhase = ''
    ar x ${src}
    tar xf data.tar.xz
    mv opt/apps/com.alibabainc.dingtalk/files/version version
    mv opt/apps/com.alibabainc.dingtalk/files/*-Release.* release
    # Cleanup
    rm -rf release/Resources/{i18n/tool/*.exe,qss/mac}
    rm -f release/{*.a,*.la,*.prl}
    rm -f release/dingtalk_updater
    rm -f release/libcurl.so.*
    rm -f release/libgtk-x11-2.0.so.*
    rm -f release/libm.so.*
    rm -f release/libstdc++.so.6
    rm -f release/libz*
  '';

  installPhase = ''
    mkdir -p $out
    mv version $out/
    # Move libraries
    # DingTalk relies on (some of) the exact libraries it ships with
    mv release $out/lib
    # Entrypoint
    mkdir -p $out/bin
    makeWrapper $out/lib/com.alibabainc.dingtalk $out/bin/dingtalk \
      --argv0 "com.alibabainc.dingtalk" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath libraries}"
    # App Menu
    mkdir -p $out/share/applications $out/share/pixmaps
    ln -s ${./dingtalk.desktop} $out/share/applications/dingtalk.desktop
    ln -s ${./dingtalk.png} $out/share/pixmaps/dingtalk.png
  '';

  meta = with lib; {
    description = "钉钉";
    homepage = "https://www.dingtalk.com/";
    platforms = [ "x86_64-linux" ];
    license = licenses.unfreeRedistributable;
  };
}
