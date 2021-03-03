{ config, pkgs, ... }:

{
    users.users.bobby285271 = { 
		isNormalUser = true;
		home = "/home/bobby285271";
		description = "Bobby Rong";
		extraGroups = [ "wheel" "networkmanager" "docker" ];
	};
}