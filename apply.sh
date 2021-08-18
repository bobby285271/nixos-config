#!/usr/bin/env bash
#sudo nix-collect-garbage -d
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ ${DIR} != "/etc/nixos" ]]
then
    sudo rm -rf /etc/nixos/*
    sudo cp -r ${DIR}/* /etc/nixos
fi
#sudo nixos-rebuild switch --upgrade
sudo env NIX_PATH=nixpkgs=$HOME/nixpkgs:nixos-config=/etc/nixos/configuration.nix nixos-rebuild boot
