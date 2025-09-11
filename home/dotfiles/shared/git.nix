{ config, pkgs, ... }:

{

  #configure git in the nix language
  programs.git = {
    enable = true;
    userName = "julianbuerge";
    userEmail = "julian.buerge@alumni.ethz.ch";
    
    extraConfig = {
	core.editor = "nvim";
	init.defaultBranch = "main";
	advice.addIgnoredFile = "false";
    };
  };

}
