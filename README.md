![](screenshot.jpg)

## NixOS 配置

是本人正在使用的配置文件！机子是 Dell Inspiron 7591，NixOS + Pantheon。本人对 NixOS / Nix 也不是特别了解，目前的需求也不是特别多，所以这个配置文件可能还不怎么完善，让大家见笑了～

### 怎么使用

将仓库内容拷贝到目标系统的 `/etc/nixos` 并按照实际情况进一步调整，需要特别留意的文件包括：

- `system/users.nix` - 用于配置用户帐号密码及权限。
- `inspiron/hardware.nix` - 用于配置分区情况，应使用 `nixos-generate-config` 生成。

如果你是首次安装 NixOS，使用 `nixos-install` 的时候希望使用国内的软件源，可以尝试指定 `substituters`：

```plain
# nixos-install --option substituters https://mirror.sjtu.edu.cn/nix-channels/store
```
