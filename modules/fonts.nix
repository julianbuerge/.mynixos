{config, pkgs, ...}:

{
    fonts.packages = with pkgs; [
	stix-two
	nerd-fonts.jetbrains-mono
    ];

    fonts.fontconfig.enable = true;

    fonts.fontconfig.defaultFonts = {
	serif = [ "STIX Two Math" ];
	#sansSerif = [ "JetBrainsMono Nerd Font" ];
	monospace = [ "JetBrainsMono Nerd Font" ];
    };
    

}
