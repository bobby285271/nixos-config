{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;  
  };

  environment.gnome3.excludePackages = with pkgs; [
    epiphany
    gnome3.cheese
		gnome3.gnome-contacts
		gnome3.gnome-maps
		gnome3.simple-scan
		gnome3.yelp
		gnome-connections
		gnome-photos
	];

}
