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

    #make sure that the font gets installed in ./fonts.nix
    #list available families with fc-list : family | sort -u
    font = {
        name = "STIX Two Math";
        size = 14;
    };
  };

}
