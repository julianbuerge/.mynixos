{pkgs, ...}: {
  #configure the gtk appearance in the nix language
  gtk = {
    enable = true;

    #a warning during rebuilding said to add this, but what sense does it make?
    gtk4.theme = null;

    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
    };

    iconTheme = {
      name = "Tela-black";
      package = pkgs.tela-icon-theme;
    };

    #Don't forget to edit the relevant environment variables in hypr.config as well
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 18;
    };

    #make sure that the font gets installed in ./fonts.nix
    #list available families with fc-list : family | sort -u
    font = {
      name = "DejaVu Sans";
      size = 12;
    };
  };
}
