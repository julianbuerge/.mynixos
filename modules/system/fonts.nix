{pkgs, ...}: {
  #installation of system fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;

  #fallback fonts, where not configured
  #list available families with fc-list : family | sort -u
  fonts.fontconfig.defaultFonts = {
    serif = ["DejaVu Serif"];
    sansSerif = ["DejaVu Sans"];
    monospace = ["JetBrainsMono Nerd Font"];
  };
}
