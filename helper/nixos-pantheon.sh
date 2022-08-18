#!/usr/bin/env bash

set -e

nixpkgs_remote="https://hub.0z.gs/NixOS/nixpkgs.git"
nixpkgs_dir="${HOME}/nixpkgs"
nixos_config_dir="${HOME}/nixos"

cd "${nixpkgs_dir}"

git fetch ${nixpkgs_remote} nixos-unstable:nixos-unstable
cd "${nixos_config_dir}"

if [ "$#" -eq 0 ]; then
    nix flake update --commit-lock-file
else
    nix flake update --commit-lock-file --override-input nixpkgs "git+file://${nixpkgs_dir}?ref=${1}"
fi

nixos-rebuild --flake "${nixos_config_dir}#inspiron" dry-run
sudo nixos-rebuild --flake "${nixos_config_dir}#inspiron" boot

sudo nix-channel --update
