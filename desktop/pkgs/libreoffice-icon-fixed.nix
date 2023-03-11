{ pkgs ? import <nixpkgs> {}, ... }:

pkgs.symlinkJoin {
  name = "libreoffice-icon-fixed";

  paths = [ pkgs.libreoffice-fresh ];

  postBuild = ''
    rm -rf $out/share $out/lib

    TMPDIR=$(mktemp -d)
    cp -r ${pkgs.libreoffice-fresh-unwrapped}/. $TMPDIR
    chmod -R +w $TMPDIR

    cat $TMPDIR/lib/libreoffice/share/xdg/calc.desktop | grep 'Icon=calc' > /dev/null

    find $TMPDIR/lib/libreoffice/share/xdg -type f -exec sed -i \
      -e s,Icon=,Icon=libreoffice-,g \
      -e s,Icon=libreoffice-document-new,Icon=document-new,g \
      {} +

    cat $TMPDIR/lib/libreoffice/share/xdg/calc.desktop | grep 'Icon=libreoffice-calc' > /dev/null
    cat $TMPDIR/lib/libreoffice/share/xdg/calc.desktop | grep 'Icon=document-new' > /dev/null

    pushd $TMPDIR/share/icons
      [ ! -f 'hicolor/32x32/apps/libreoffice-base.png' ]
      [ -f 'hicolor/32x32/apps/base.png' ]
      # https://unix.stackexchange.com/questions/310256/for-all-directories-rename-all-subdirectories-with-a-prefix
      find . -maxdepth 4 -mindepth 4 -type f -execdir bash -c 'cp "$1" "./libreoffice-''${1#./}"' mover {} \;
      [ -f 'hicolor/32x32/apps/libreoffice-base.png' ]
    popd

    cp -r $TMPDIR/share $out
    cp -r $TMPDIR/lib $out
  '';
}
