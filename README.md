## NixOS 配置

是本人正在使用的配置文件！机子是 Dell Inspiron 7591，NixOS Unstable 系统。

本人对 NixOS / Nix 也不是特别了解，目前个人的实际需求也不是特别多，所以这个配置文件可能还不怎么完善，让大家见笑了～

### 怎么使用

如果你计划入坑 NixOS，要注意 NixOS 的安装方式跟其它发行版是有很大很大很大的区别，可以去看一看 [NixOS Manual](https://nixos.org/manual/nixos/unstable/) 哦！

要使用我的配置档的话，要确保你位于 `nixos-unstable` 频道（[这里](https://mirrors.tuna.tsinghua.edu.cn/help/nix/) 有文档说明哦），接下来就只需要将 `hardware-configuration.nix` 备份一下，然后将这个仓库的文件放置到目标系统的 `/etc/nixos` 目录下，然后将我的 `hardware-configuration.nix` 换成你的就行啦！

注意有些地方你可能还需要再做点调整，直接照搬得到的系统不一定适合你的情况哦。

### 文件

将配置项按照用途做了简单的分类！

* [`sys/boot.nix`](sys/boot.nix)：引导相关（包括引导程序、启动参数等）。
* [`sys/desktop.nix`](sys/desktop.nix)：桌面相关（桌面环境、登录管理器等）。
* [`sys/fonts.nix`](sys/fonts.nix)：字体相关（安装的字体包等）。
* [`sys/i18n.nix`](sys/i18n.nix)：语言相关（输入法、时区等）。
* [`sys/network.nix`](sys/network.nix)：网络相关（DNS 服务器、网络服务等）。
* [`sys/system.nix`](sys/system.nix)：系统相关（Shell、声音等）。
* [`sys/users.nix`](sys/users.nix)：用户相关（用户组、sudo 配置等）。
* [`sys/virtualisation.nix`](sys/virtualisation.nix)：虚拟化相关（Podman、Flatpak 等）。
