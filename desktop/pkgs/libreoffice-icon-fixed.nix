{ pkgs, lib, ... }:

pkgs.symlinkJoin {
  name = "libreoffice-icon-fixed";

  paths = [ pkgs.libreoffice-fresh ];

  postBuild = ''
    rm -rf $out/share

    TMPDIR=$(mktemp -d)
    cp -r ${pkgs.libreoffice-fresh-unwrapped}/. $TMPDIR
    chmod -R +w $TMPDIR
    rm $TMPDIR/share/applications   # symbolic link
    cp -r ${pkgs.libreoffice-fresh}/share/applications/ $TMPDIR/share/applications/
    chmod -R +w $TMPDIR

    pushd $TMPDIR/share/applications
      cat calc.desktop | grep 'Icon=calc' > /dev/null
      find . -type f -exec sed -i \
        -e s,Icon=,Icon=libreoffice-,g \
        -e s,Icon=libreoffice-document-new,Icon=document-new,g \
        {} +
    popd

    pushd $TMPDIR/share/icons
      [ ! -f 'hicolor/32x32/apps/libreoffice-base.png' ]
      [ -f 'hicolor/32x32/apps/base.png' ]
      # https://unix.stackexchange.com/questions/310256/for-all-directories-rename-all-subdirectories-with-a-prefix
      find . -maxdepth 4 -mindepth 4 -type f -execdir bash -c 'cp "$1" "./libreoffice-''${1#./}"' mover {} \;
    popd

    cp -r $TMPDIR/share $out

    cat $out/share/applications/calc.desktop | grep 'Icon=libreoffice-calc' > /dev/null
    cat $out/share/applications/calc.desktop | grep 'Icon=document-new' > /dev/null
    [ -f "$out/share/icons/hicolor/32x32/apps/libreoffice-base.png" ]
  '';
}
