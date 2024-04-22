#!/usr/bin/env bash

nixos_config_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && dirname "$(pwd)")"

cd ${nixos_config_dir}

rm -f desktop/{firefox,fonts,packages}.nix
rm -f system/{lamp,python,virtualisation}.nix
