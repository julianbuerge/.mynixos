{config, pkgs, ... }:

{

  home.file = {
    ".themes/BlackPurple/gtk-3.0/gtk.css".source = ./gtk-black-purple-theme/gtk.css;
    ".themes/BlackPurple/gtk-4.0/gtk.css".source = ./gtk-black-purple-theme/gtk.css;
    ".themes/BlackPurple/gtk-4.0/gtk-dark.css".source = ./gtk-black-purple-theme/gtk.css;
    ".themes/BlackPurple/index.theme".source = ./gtk-black-purple-theme/index.theme;
  };

  #configure the gtk appearance in the nix language
  gtk = {
    enable = true;

    theme = {
	name = "BlackPurple";
    };

    iconTheme = {
	name = "Reversal-dark";
	package = pkgs.reversal-icon-theme;
    };

    #Don't forget to edit the relevant environment variables in hypr.config as well
    cursorTheme = {
	name = "Bibata-Modern-Classic";
	package = pkgs.bibata-cursors;
	size = 24;
    };
  };

}
