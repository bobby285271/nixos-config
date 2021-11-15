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
      "140.82.112.22" = [ "central.github.com" ];
      "140.82.112.25" = [ "live.github.com" ];
      "140.82.112.3" = [
        "gist.github.com"
        "github.com"
      ];
      "140.82.114.25" = [ "alive.github.com" ];
      "140.82.114.5" = [ "api.github.com" ];
      "140.82.114.9" = [ "codeload.github.com" ];
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
      "23.100.27.125" = [ "github.dev" ];
      "52.217.129.153" = [ "github-production-repository-file-5c1aeb.s3.amazonaws.com" ];
      "52.217.174.129" = [ "github-production-user-asset-6210df.s3.amazonaws.com" ];
      "52.217.199.41" = [ "github-com.s3.amazonaws.com" ];
      "52.217.223.17" = [ "github-cloud.s3.amazonaws.com" ];
      "52.217.93.164" = [ "github-production-release-asset-2e65be.s3.amazonaws.com" ];
      "64.71.144.202" = [ "github.community" ];
    };
  };
}
