{pkgs, ...}: {
  #configure the gtk appearance in the nix language
  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
    };

    iconTheme = {
      name = "Reversal-black-dark";
      package = pkgs.reversal-icon-theme.override {
        colorVariants = ["-black"];
      };
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
