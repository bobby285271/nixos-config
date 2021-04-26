#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ ${DIR} != "/etc/nixos" ]]
then
    sudo rm -rf /etc/nixos/*
    sudo cp -r ${DIR}/* /etc/nixos
fi
sudo nixos-rebuild switch --upgrade