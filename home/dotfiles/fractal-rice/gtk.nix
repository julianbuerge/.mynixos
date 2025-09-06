{config, pkgs, ... }:

{

 #configure the gtk appearance in the nix language
  gtk = {
    enable = true;

    theme = {
	name = "Orchis-Purple-Dark";
	package = pkgs.orchis-theme.override {
	    tweaks = [ "black" ];
	};
    };

    iconTheme = {
	name = "Reversal-black-dark";
	package = pkgs.reversal-icon-theme.override {
	    colorVariants = [ "-black" ]; 
	};
    };

    #Don't forget to edit the relevant environment variables in hypr.config as well
    cursorTheme = {
	name = "Bibata-Modern-Classic";
	package = pkgs.bibata-cursors;
	size = 24;
    };
  };

}
