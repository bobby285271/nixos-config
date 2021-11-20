{ config, pkgs, ... }:

{
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
  };
}
