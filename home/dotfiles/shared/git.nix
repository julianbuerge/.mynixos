{ config, pkgs, variables, ... }:

{

  #configure git in the nix language
  programs.git = {
    enable = true;
    userName = variables.gitusername;
    userEmail = variables.gitemail;
    
    extraConfig = {
	core.editor = "nvim";
	init.defaultBranch = "main";
	advice.addIgnoredFile = "false";
    };
  };

}
