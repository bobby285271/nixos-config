{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "master";
      url."https://github.com.cnpmjs.org/".insteadOf = [
        "https://github.com/"
      ];
      core.compression = 0;
      http.postBuffer = 1048576000;
      protocol."https".allow = "always";
    };
  };
}
