{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  #Define the fallback default fonts (any that are not handled by gtk or app specific configs)
  fonts.fontconfig.enable = true;

  
  #list available families with fc-list : family | sort -u
  fonts.fontconfig.defaultFonts = {
    serif = [ "STIX Two Math" ];
    monospace = [ "JetBrainsMono Nerd Font" ];
  };

}

