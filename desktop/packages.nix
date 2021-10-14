{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    pantheon.appcenter
    vscode-fhs
  ];
}
