#!/usr/bin/env bash

set -e

if [ "$#" -ne 1 ] && [ "$#" -ne 2 ]; then
    echo -e "\033[36m🛠️  Usage: __internal-update-common.sh \$profile \$checkout\033[0m"
    false
fi


nixpkgs_remote="https://hub.fgit.cf/NixOS/nixpkgs"
nixpkgs_dir="${HOME}/nixpkgs"
nixos_config_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && dirname "$(pwd)")"

echo -e "\033[36m🛠️  Updating nixpkgs checkout\033[0m"
cd "${nixpkgs_dir}"

git fetch ${nixpkgs_remote} nixos-unstable:nixos-unstable || true
git fetch ${nixpkgs_remote} master:upstream || true
git fetch ${nixpkgs_remote} staging:staging || true

echo -e "\n\033[36m🛠️  Updating flake lock\033[0m"  
cd "${nixos_config_dir}"
if [ "$#" -eq 1 ]; then
    nix flake update --commit-lock-file
else
    nix flake update --commit-lock-file --override-input nixpkgs "git+file://${nixpkgs_dir}?ref=${2}"
fi


echo -e "\n\033[36m🛠️  Testing profile:\033[0m ${1}"
nixos-rebuild --flake "${nixos_config_dir}#${1}" dry-run --impure


echo -e "\n\033[36m🛠️  Building profile:\033[0m ${1}"
sudo nixos-rebuild --flake "${nixos_config_dir}#${1}" boot --impure


echo -e "\n\033[36m🛠️  Updating channel\033[0m"
sudo nix-channel --update


echo -e "\n\033[36m🛠️  Cleaning up\033[0m"
gsettings reset-recursively org.gnome.desktop.wm.preferences || true
gsettings reset-recursively org.gnome.desktop.interface || true
gsettings reset-recursively org.gnome.settings-daemon.plugins.xsettings || true
