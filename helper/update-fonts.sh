#!/usr/bin/env bash

# You won't need this.

dest_dir="${HOME}/.local/share/fonts/"
ms_font_path="/srv/html/nixos-pkgs/ms-fonts.zip"

rm -rf ${dest_dir}
mkdir -p ${dest_dir}
cd /run/current-system/sw/share/X11/fonts
for i in $(readlink *)
do
    echo "${i}"
    cp -f "${i}" "${dest_dir}"
done
unzip -o -j "${ms_font_path}" -d "${dest_dir}"
fc-cache -v
