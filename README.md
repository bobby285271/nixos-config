## NixOS 配置

是本人正在使用的配置文件！机子是 Dell Inspiron 7591，NixOS Unstable 系统。本人对 NixOS / Nix 也不是特别了解，目前个人的实际需求也不是特别多，所以这个配置文件可能还不怎么完善，让大家见笑了～另外本人暂时还没有入坑 Flakes，虽然说我在滚系统的时候已经在指定 `NIX_PATH` 了（逃）。

### 怎么使用

如果你计划入坑 NixOS，要注意 NixOS 的安装方式跟其它发行版是有很大很大很大的区别，可以去看一看 [NixOS Manual](https://nixos.org/manual/nixos/unstable/) 哦！要使用我的配置档的话，要确保你位于 `nixos-unstable` 频道（[这里](https://mirrors.tuna.tsinghua.edu.cn/help/nix/) 有文档说明），接下来就只需要将生成的 `hardware-configuration.nix` 备份一下，然后将这个仓库的文件放置到**目标系统**的 `/etc/nixos` 目录下，然后按需配置一下就行。

按需配置指的是浏览这里的每一个文件，将我的东西改成你的，例如 `desktop/users.nix` 下的用户名和密码就需要更换，`inspiron/hardware.nix` 下的分区配置也需要更换（换成前面让你备份的 `hardware-configuration.nix`），直接照搬得到的系统不一定适合你的情况哦。

如果你是首次安装 NixOS，使用 `nixos-install` 的时候希望使用国内的软件源，可以尝试指定 `substituters`：

```plain
# nixos-install --option substituters https://mirror.sjtu.edu.cn/nix-channels/store
```

### 关于文件分类

其实我也不知道怎么分类，或许早日入坑 Flakes 直接套 [DevOS](https://github.com/divnix/devos) 模板才是正道，嗯快了快了。
