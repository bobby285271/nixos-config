{ pkgs, ... }:

pkgs.symlinkJoin {
  name = "libreoffice-icon-fixed";

  paths = [ pkgs.libreoffice-fresh ];

  postBuild = ''
    rm -r $out/share/applications
    TMPDIR=$(mktemp -d)
    cp -r ${pkgs.libreoffice-fresh}/share/applications/. $TMPDIR

    # Is the issue fixed upstream?
    cat $TMPDIR/calc.desktop | grep 'Icon=calc' > /dev/null

    find $TMPDIR -type f -exec sed -i \
      -e s,Icon=,Icon=libreoffice-,g \
      -e s,Icon=libreoffice-document-new,Icon=document-new,g \
      {} +

    cp -r $TMPDIR/. $out/share/applications

    # Is the issue fixed downstream?
    cat $out/share/applications/calc.desktop | grep 'Icon=libreoffice-calc' > /dev/null
    cat $out/share/applications/calc.desktop | grep 'Icon=document-new' > /dev/null

    rm -r $out/share/icons
    TMPDIR2=$(mktemp -d)
    cp -r -L ${pkgs.libreoffice-fresh}/share/icons/. $TMPDIR2
    find $TMPDIR2 -type d -exec chmod 755 {} \;

    # https://unix.stackexchange.com/questions/310256/for-all-directories-rename-all-subdirectories-with-a-prefix
    find $TMPDIR2 -maxdepth 4 -mindepth 4 -type f -execdir bash -c 'cp "$1" "./libreoffice-''${1#./}"' mover {} \;

    cp -r $TMPDIR2/. $out/share/icons
  '';
}
