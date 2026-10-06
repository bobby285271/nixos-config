{
  services = {
    avahi = {
      enable = true;
      publish.enable = true;
      publish.userServices = true;
    };

    # v2raya.enable = true;
  };

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    autoStart = true;
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
      "128.242.245.189" = [ "github.global.ssl.fastly.net" ];
      "13.107.42.16" = [ "pipelines.actions.githubusercontent.com" ];
      "140.82.112.22" = [ "api.individual.githubcopilot.com" ];
      "140.82.112.26" = [ "live.github.com" ];
      "140.82.113.17" = [ "github.community" ];
      "140.82.114.21" = [
        "collector.github.com"
        "education.github.com"
      ];
      "140.82.114.22" = [ "central.github.com" ];
      "140.82.114.25" = [ "alive.github.com" ];
      "150.171.110.108" = [ "vscode.dev" ];
      "16.15.191.34" = [ "github-production-user-asset-6210df.s3.amazonaws.com" ];
      "16.15.213.52" = [ "github-production-release-asset-2e65be.s3.amazonaws.com" ];
      "16.15.253.111" = [ "github-com.s3.amazonaws.com" ];
      "16.15.254.205" = [ "github-production-repository-file-5c1aeb.s3.amazonaws.com" ];
      "16.15.254.75" = [ "github-cloud.s3.amazonaws.com" ];
      "185.199.108.153" = [
        "github.io"
        "githubstatus.com"
      ];
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
      "185.199.110.215" = [ "github.githubassets.com" ];
      "192.0.66.2" = [ "github.blog" ];
      "20.205.243.165" = [ "codeload.github.com" ];
      "20.205.243.166" = [ "github.com" ];
      "20.205.243.168" = [ "api.github.com" ];
      "46.82.174.68" = [ "gist.github.com" ];
    };
  };
}
