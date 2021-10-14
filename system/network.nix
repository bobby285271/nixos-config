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
      # https://github.com/521xueweihan/GitHub520
      "140.82.112.21" = [ "central.github.com" ];
      "140.82.113.10" = [ "codeload.github.com" ];
      "140.82.113.26" = [ "alive.github.com" ];
      "140.82.113.3" = [
        "gist.github.com"
        "github.com"
      ];
      "140.82.113.6" = [ "api.github.com" ];
      "140.82.114.26" = [ "live.github.com" ];
      "185.199.108.133" = [
        "desktop.githubusercontent.com"
        "camo.githubusercontent.com"
        "github.map.fastly.net"
        "raw.githubusercontent.com"
        "user-images.githubusercontent.com"
        "favicons.githubusercontent.com"
        "avatars5.githubusercontent.com"
        "avatars4.githubusercontent.com"
        "avatars3.githubusercontent.com"
        "avatars2.githubusercontent.com"
        "avatars1.githubusercontent.com"
        "avatars0.githubusercontent.com"
        "avatars.githubusercontent.com"
        "media.githubusercontent.com"
      ];
      "185.199.108.153" = [
        "assets-cdn.github.com"
        "github.io"
        "githubstatus.com"
      ];
      "185.199.108.154" = [ "github.githubassets.com" ];
      "192.0.66.2" = [ "github.blog" ];
      "199.232.69.194" = [ "github.global.ssl.fastly.net" ];
      "52.216.248.76" = [ "github-cloud.s3.amazonaws.com" ];
      "52.217.135.41" = [ "github-production-release-asset-2e65be.s3.amazonaws.com" ];
      "52.217.139.201" = [ "github-production-user-asset-6210df.s3.amazonaws.com" ];
      "52.217.202.233" = [ "github-production-repository-file-5c1aeb.s3.amazonaws.com" ];
      "52.217.70.132" = [ "github-com.s3.amazonaws.com" ];
      "64.71.144.202" = [ "github.community" ];
    };
  };
}
