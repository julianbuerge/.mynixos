{ config, pkgs, ... }:

{
  #configure bash
  programs.bash = {
    enable = true;
    shellAliases = {
	mpvi = "mpv --image-display-duration=inf";
        calc = "nix repl";
        gpu = "watch -n 1 nvidia-smi";
	tree1 = "tree -L 1";
	tree2 = "tree -L 2";
	tree3 = "tree -L 3";
	tree4 = "tree -L 4";
	matrix = "cmatrix -B -C magenta -u 3";
        rmHomeTrash = "rm -r ~/.local/share/Trash/files/*; rm -r ~/.local/share/Trash/info/*";
        rmDataTrash = "rm -r ~/Data/.Trash-1000/files/*; rm -r ~/Data/.Trash-1000/info/*";
    };
  };
}
