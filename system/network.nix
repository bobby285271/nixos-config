{
  services = {
    avahi = {
      enable = true;
      publish.enable = true;
      publish.userServices = true;
    };

    v2raya.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [
        80
        443
        5353
        8080
        42000
        42001
        11694
      ];
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764; # KDE connect
        }
      ];
    };
    # nameservers = [
    #   "119.29.29.29"
    #   "223.5.5.5"
    # ];
    hosts = {
      # GitHub
      "13.107.246.73" = [ "vscode.dev" ];
      "13.107.42.16" = [ "pipelines.actions.githubusercontent.com" ];
      "140.82.112.21" = [ "api.individual.githubcopilot.com" ];
      "140.82.113.18" = [ "github.community" ];
      "140.82.113.21" = [
        "central.github.com"
        "collector.github.com"
        "education.github.com"
      ];
      "140.82.113.25" = [ "live.github.com" ];
      "140.82.113.26" = [ "alive.github.com" ];
      "151.101.193.194" = [ "github.global.ssl.fastly.net" ];
      "16.182.37.121" = [ "github-cloud.s3.amazonaws.com" ];
      "16.182.99.185" = [ "github-com.s3.amazonaws.com" ];
      "185.199.110.133" = [
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
        "user-images.githubusercontent.com"
        "private-user-images.githubusercontent.com"
      ];
      "185.199.111.153" = [
        "github.io"
        "githubstatus.com"
      ];
      "185.199.111.154" = [ "github.githubassets.com" ];
      "192.0.66.2" = [ "github.blog" ];
      "20.205.243.165" = [ "codeload.github.com" ];
      "20.205.243.166" = [
        "gist.github.com"
        "github.com"
      ];
      "20.205.243.168" = [ "api.github.com" ];
      "3.5.0.129" = [ "github-production-user-asset-6210df.s3.amazonaws.com" ];
      "3.5.2.206" = [ "github-production-release-asset-2e65be.s3.amazonaws.com" ];
      "52.216.186.139" = [ "github-production-repository-file-5c1aeb.s3.amazonaws.com" ];
      # Cachix
      "104.26.13.82" = [ "nix-community.cachix.org" ];
      # ????
      "104.244.42.69" = [ "t.co" ];
    };
  };
}
