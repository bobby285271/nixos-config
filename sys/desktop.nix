{ config, pkgs, ... }:

{
	services.xserver = {
		enable = true;
		layout = "us";
		displayManager.lightdm = {
			enable = true;
			greeters.pantheon.enable = true;
		};
		desktopManager.pantheon.enable = true;	
	};
}