{
  virtualisation = {
    docker = {
      enable = true;
      daemon.settings = {
        "registry-mirrors" = [ "https://bobm60dq.mirror.aliyuncs.com" ];
        "live-restore" = false;
      };
    };
    libvirtd.enable = true;
  };
}
