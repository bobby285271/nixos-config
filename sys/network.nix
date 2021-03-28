{ config, pkgs, ... }:

{
  networking = {
    hostName = "inspiron";
    networkmanager.enable = true;
    nameservers = [
      "119.29.29.29"
      "223.5.5.5"
    ];
  };

  services = {
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
    httpd = {
      enable = true;
      adminAddr = "admin@bobby285271.top";
      virtualHosts.localhost.documentRoot = "/srv/html";
      enablePHP = true;
    };
    openssh.enable = true;
  };
}
