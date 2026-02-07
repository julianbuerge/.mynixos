{pkgs, ...}: {
  #configure the gtk appearance in the nix language
  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Yellow-Dark";
      package = pkgs.orchis-theme.override {
        tweaks = ["black"];
      };
    };

    iconTheme = {
      name = "Tela-black";
      package = pkgs.tela-icon-theme;
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
