{ config, pkgs, ... }:

let

variables = import ../../../hosts/variables.nix;
name = variables.gitusername;
email = variables.gitemail;

in {

  #configure git in the nix language
  programs.git = {
    enable = true;
    userName = name;
    userEmail = email;
    
    extraConfig = {
	core.editor = "nvim";
	init.defaultBranch = "main";
	advice.addIgnoredFile = "false";
    };
  };

}
