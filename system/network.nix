{
  networking = {
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 80 443 5353 8080 42000 42001 ];
    nameservers = [
      "119.29.29.29"
      "223.5.5.5"
    ];
    hosts = {
      # GitHub
      "13.107.238.51" = [ "vscode.dev" ];
      "13.107.42.16" = [ "pipelines.actions.githubusercontent.com" ];
      "140.82.112.26" = [
        "alive.github.com"
        "live.github.com"
      ];
      "140.82.112.9" = [ "codeload.github.com" ];
      "140.82.113.21" = [
        "central.github.com"
        "collector.github.com"
      ];
      "140.82.114.17" = [ "github.community" ];
      "140.82.114.3" = [
        "gist.github.com"
        "github.com"
      ];
      "140.82.114.6" = [ "api.github.com" ];
      "151.101.65.194" = [ "github.global.ssl.fastly.net" ];
      "185.199.108.133" = [
        "avatars.githubusercontent.com"
        "avatars0.githubusercontent.com"
        "avatars1.githubusercontent.com"
        "avatars2.githubusercontent.com"
        "avatars3.githubusercontent.com"
        "avatars4.githubusercontent.com"
        "avatars5.githubusercontent.com"
        "camo.githubusercontent.com"
        "cloud.githubusercontent.com"
        "desktop.githubusercontent.com"
        "favicons.githubusercontent.com"
        "github.map.fastly.net"
        "media.githubusercontent.com"
        "objects.githubusercontent.com"
        "raw.githubusercontent.com"
      ];
      "185.199.109.154" = [ "github.githubassets.com" ];
      "185.199.110.153" = [
        "assets-cdn.github.com"
        "github.io"
        "githubstatus.com"
      ];
      "185.199.111.133" = [ "user-images.githubusercontent.com" ];
      "192.0.66.2" = [ "github.blog" ];
      "52.217.141.73" = [ "github-production-user-asset-6210df.s3.amazonaws.com" ];
      "52.217.206.193" = [ "github-production-repository-file-5c1aeb.s3.amazonaws.com" ];
      "52.217.234.145" = [ "github-com.s3.amazonaws.com" ];
      "54.231.132.193" = [ "github-cloud.s3.amazonaws.com" ];
      "54.231.139.249" = [ "github-production-release-asset-2e65be.s3.amazonaws.com" ];
      # Cachix
      "104.26.13.82" = [ "nix-community.cachix.org" ];
    };
  };
}
