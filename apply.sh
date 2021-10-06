#!/usr/bin/env bash

CURRENT_DIR="$(pwd)"
PROFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NIXPKGS_DIR="/home/bobby285271/nixpkgs"
REBUILD_CMD="sudo env NIX_PATH=nixpkgs=${NIXPKGS_DIR}:nixos-config=/etc/nixos/configuration.nix nixos-rebuild"

cd ${NIXPKGS_DIR}
echo -e "\033[33m================================================================\033[0m"
echo "Current NixOS version: $(nixos-version)"
echo "Target branch:         $(git branch --show-current)"
echo -e "\033[33m================================================================\033[0m"
echo "$(git log -3)"
echo -e "\033[33m================================================================\033[0m"
cd ${CURRENT_DIR}
read 

if [[ ${PROFILE_DIR} != "/etc/nixos" ]]
then
    sudo rm -rf /etc/nixos/*
    sudo cp -r ${PROFILE_DIR}/* /etc/nixos
fi

if [ "$#" -eq 0 ]; then
    ${REBUILD_CMD} boot
else
    ${REBUILD_CMD} $*
fi
