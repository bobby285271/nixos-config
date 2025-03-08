#!/usr/bin/env bash

sudo mkdir /run/systemd/system/nix-daemon.service.d/
sudo cat << EOF >/run/systemd/system/nix-daemon.service.d/override.conf  
[Service]
Environment="http_proxy=http://localhost:20172"
Environment="https_proxy=http://localhost:20172"
Environment="all_proxy=http://localhost:20172"
EOF
sudo systemctl daemon-reload
sudo systemctl restart nix-daemon
