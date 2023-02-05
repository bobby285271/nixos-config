{ pkgs, ... }:

pkgs.symlinkJoin {
  name = "libreoffice-icon-fixed";

  paths = [ pkgs.libreoffice-fresh ];

  postBuild = ''
    rm -r $out/share/applications
    TMPDIR=$(mktemp -d)
    cp -r ${pkgs.libreoffice-fresh}/share/applications/. $TMPDIR

    find $TMPDIR -type f -exec sed -i \
      -e s,Icon=,Icon=libreoffice-,g \
      -e s,Icon=libreoffice-document-new,Icon=document-new,g \
      {} +

    cp -r $TMPDIR/. $out/share/applications
    cat $out/share/applications/calc.desktop | grep 'Icon=libreoffice-calc' > /dev/null
    cat $out/share/applications/calc.desktop | grep 'Icon=document-new' > /dev/null
  '';
}
