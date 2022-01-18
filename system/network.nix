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
      "140.82.112.26" = [ "alive.github.com" ];
      "140.82.113.3" = [ "github.com" ];
      "140.82.113.5" = [ "api.github.com" ];
      "140.82.114.21" = [ "central.github.com" ];
      "140.82.114.25" = [ "live.github.com" ];
      "140.82.114.3" = [ "gist.github.com" ];
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
        "cloud.githubusercontent.com"
        "objects.githubusercontent.com"
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
      "52.216.145.163" = [ "github-production-release-asset-2e65be.s3.amazonaws.com" ];
      "52.216.145.99" = [ "github-production-user-asset-6210df.s3.amazonaws.com" ];
      "52.217.108.140" = [ "github-cloud.s3.amazonaws.com" ];
      "52.217.12.220" = [ "github-com.s3.amazonaws.com" ];
      "52.217.75.180" = [ "github-production-repository-file-5c1aeb.s3.amazonaws.com" ];
      "64.71.144.202" = [ "github.community" ];
    };
  };
}
