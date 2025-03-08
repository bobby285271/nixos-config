#!/usr/bin/env bash

sudo mkdir /run/systemd/system/nix-daemon.service.d/
sudo echo "[Service]" > /run/systemd/system/nix-daemon.service.d/override.conf
sudo echo 'Environment="http_proxy=http://localhost:20172"' >> /run/systemd/system/nix-daemon.service.d/override.conf
sudo echo 'Environment="https_proxy=http://localhost:20172"' >> /run/systemd/system/nix-daemon.service.d/override.conf
sudo echo 'Environment="all_proxy=http://localhost:20172"' >> /run/systemd/system/nix-daemon.service.d/override.conf
sudo systemctl daemon-reload
sudo systemctl restart nix-daemon
