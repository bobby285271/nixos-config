{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    vscode-fhs
  ];
}
