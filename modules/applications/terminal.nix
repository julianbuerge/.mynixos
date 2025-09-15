{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager #dotfile management package,
    kitty #the terminal itself
    nh
    bat
    git
    tealdeer
    cowsay
    asciiquarium
    sl
    cmatrix
    tree
    fastfetch
    btop
    unzip
    yazi
    playerctl
  ];
    
  #configure bash
  programs.bash = {
    enable = true;
    promptInit = ''
	PS1='\[\e[1m\]\$\[\e[0;38;5;99m\]\u\[\e[0m\] \[\e[30;48;5;99;1m\]\w\[\e[0m\] '
    '';
    shellAliases = {
	mpvi = "mpv --image-display-duration=inf";
        calc = "nix repl";
	tree1 = "tree -L 1";
	tree2 = "tree -L 2";
	tree3 = "tree -L 3";
	tree4 = "tree -L 4";
	matrix = "cmatrix -B -C magenta -u 3";
    };
  };

  #install a nerd font to use in kitty (the kitty config sets it)
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

}
