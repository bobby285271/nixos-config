![](screenshot.jpg)

## NixOS 配置

是本人正在使用的配置文件！机子是 Dell Inspiron 7591，NixOS + Pantheon。本人对 NixOS / Nix 也不是特别了解，目前的需求也不是特别多，也还没有入坑 Flakes 或是 Home Manager，所以这个配置文件可能还不怎么完善，让大家见笑了～

### 怎么使用

将仓库内容拷贝到目标系统的 `/etc/nixos` 并按照实际情况进一步调整，需要特别留意的文件包括：

- `desktop/users.nix` - 用于配置用户帐号密码及权限。
- `inspiron/hardware.nix` - 用于配置分区情况，应使用 `nixos-generate-config` 生成。

如果你是首次安装 NixOS，使用 `nixos-install` 的时候希望使用国内的软件源，可以尝试指定 `substituters`：

```plain
# nixos-install --option substituters https://mirror.sjtu.edu.cn/nix-channels/store
```

### 关于文件

其实我也不知道怎么分类，或许早日入坑 DevOS 才是正道...

- `cachix/` 给 Pantheon 打包时存包用的，欢迎大家在 NixOS 上用 Pantheon！
- `desktop/` 换机时不需要重新配的各类配置。
- `inspiron/` 换机时需要重新配的各类配置，例如驱动和分区等。
- `packages/` 需要用到的一些软件包，目前都是 Nixpkgs 里的还没有野包。
