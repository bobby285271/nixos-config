{ config, pkgs, ... }:

{
  networking = {
    hostName = "inspiron";
    networkmanager.enable = true;
    nameservers = [
      "119.29.29.29"
      "223.5.5.5"
    ];
    hosts = {
      # https://zhuanlan.zhihu.com/p/107334179
      "140.82.113.4" = [ "github.com" ];
      "140.82.114.5" = [ "api.github.com" ];
      "185.199.108.154" = [ "help.github.com" ];
      "199.232.69.194" = [ "github.global.ssl.fastly.net" ];
      "140.82.113.9" = [
        "nodeload.github.com"
        "codeload.github.com"
      ];
      "185.199.108.133" = [
        "raw.github.com"
        "training.github.com"
        "assets-cdn.github.com"
        "documentcloud.github.com"
        "githubstatus.com"
        "raw.githubusercontent.com"
        "cloud.githubusercontent.com"
        "gist.githubusercontent.com"
        "marketplace-screenshots.githubusercontent.com"
        "repository-images.githubusercontent.com"
        "user-images.githubusercontent.com"
        "desktop.githubusercontent.com"
        "avatars.githubusercontent.com"
        "avatars0.githubusercontent.com"
        "avatars1.githubusercontent.com"
        "avatars2.githubusercontent.com"
        "avatars3.githubusercontent.com"
        "avatars4.githubusercontent.com"
        "avatars5.githubusercontent.com"
        "avatars6.githubusercontent.com"
        "avatars7.githubusercontent.com"
        "avatars8.githubusercontent.com"
      ];
    };
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
