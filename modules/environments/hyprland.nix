{ config, pkgs, ... }:

{
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	xdg.portal = {
	    enable = true;
	    extraPortals = [ 
		pkgs.xdg-desktop-portal-gtk
		pkgs.xdg-desktop-portal-wlr #wiki says this is needed for screen sharing in firefox
	    ];
	};

	environment.systemPackages = with pkgs; [
		waybar
		wofi
		swww
                mpvpaper
		dunst
	];
}
