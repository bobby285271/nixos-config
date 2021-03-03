# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	nix.binaryCaches = [ 
		"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
	];

	boot = {
		plymouth.enable = true;
		extraModprobeConfig = ''
			options bbswitch load_state=0 unload_state=1
		'';
		extraModulePackages = [ pkgs.linuxPackages.bbswitch ];
		kernelModules = [ "bbswitch" ];
		loader = {
			efi.canTouchEfiVariables = true;
			grub = {
				enable = true;
				device = "nodev";
				useOSProber = true;
				efiSupport = true;
			};
		};
		blacklistedKernelModules = [
			"nouveau"
			"rivafb"
			"nvidiafb"
			"rivatv"
			"nv"
			"uvcvideo"
		];
	};

	networking = {
		hostName = "inspiron";
		networkmanager.enable = true;
	};

	i18n = {
		defaultLocale = "zh_CN.UTF-8";
		supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
		inputMethod = {
			enabled = "fcitx5";
			fcitx5.addons = [ pkgs.fcitx5-chinese-addons ];
		};
	};

	time.timeZone = "Asia/Shanghai";

	location = {
		latitude = 23.0;
		longitude = 113.0;
	};

	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; 
	[
		dos2unix
		fcitx
		fcitx-configtool
		firefox
		gcc
		gdb
		git
		gnumake
		gnupg
		gptfdisk
		libreoffice-fresh
		neofetch
		p7zip
		pciutils 
		python
		qemu
		rustup
		transmission
		vim
		wget
	];

	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	};

	fonts = {
		enableDefaultFonts = true;
		fontconfig.enable = true;
		fontDir.enable = true;
		enableGhostscriptFonts = true;
		fonts = with pkgs; [
			noto-fonts
			noto-fonts-cjk
			noto-fonts-emoji
			wqy_microhei
			wqy_zenhei
		];
	};

	services = {
		flatpak.enable = true;
		openssh.enable = true;
		xserver = {
			enable = true;
			layout = "us";
			displayManager.lightdm = {
				enable = true;
				greeters.pantheon.enable = true;
			};
			desktopManager.pantheon.enable = true;
			
		};
		tlp.enable = true;
		mysql = {
			enable = true;
			package = pkgs.mariadb;
		};
		httpd = {
			enable = true;
			adminAddr = "admin@bobby285271.top";
			virtualHosts.localhost.documentRoot = "/srv/html";
			enablePHP = true;
		};
	};

	programs.bash.enableCompletion = true;
	sound.enable = true;
	hardware.pulseaudio.enable = true;
	virtualisation.podman = {
		enable = true;
		dockerCompat = true;
	};
  
	users.users.bobby285271 = { 
		isNormalUser = true;
		home = "/home/bobby285271";
		description = "Bobby Rong";
		extraGroups = [ "wheel" "networkmanager" "docker" ];
	};

	system = {
		autoUpgrade.enable = true;
		stateVersion = "21.05";
	};
}
