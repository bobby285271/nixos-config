#!/usr/bin/env bash
nixpkgs_remote="https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git"
nixpkgs_dir="${HOME}/nixpkgs"
nixos_config_dir="${HOME}/nixos"

cd "${nixpkgs_dir}"
git checkout upstream
git fetch ${nixpkgs_remote} nixos-unstable:nixos-unstable
cd "${nixos_config_dir}"

if [ "$#" -eq 0 ]; then
    nix flake update --commit-lock-file
else
    nix flake update --commit-lock-file --override-input nixpkgs "git+file://${nixpkgs_dir}/?ref=${1}"
fi

sudo nixos-rebuild --flake "${nixos_config_dir}#inspiron" boot
