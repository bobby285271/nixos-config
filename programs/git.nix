{
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "master";
      core.compression = 0;
      http.postBuffer = 1048576000;
      protocol."https".allow = "always";
    };
  };
}
