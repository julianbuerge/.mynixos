{ config, pkgs, ... }:

{
  home.username = "julian";
  home.homeDirectory = "/home/julian";

  #initially installed version. helps the system from ever breaking. never change it.
  home.stateVersion = "25.05";

  imports = [
    ./dotfiles/fractal-rice/gtk.nix
    ./dotfiles/fractal-rice/modify-desktop-entries.nix
  ];

  home.file = {

    #source the config files that we have in the original format
    #(so that we could use a different OS and package manager in the future)
    ".config/kitty/kitty.conf".source = ./dotfiles/fractal-rice/kitty.conf;
    ".config/kitty/kitty-theme.conf".source = ./dotfiles/fractal-rice/kitty-theme.conf;
    ".config/waybar/config".source = ./dotfiles/fractal-rice/waybar-config;
    ".config/waybar/style.css".source = ./dotfiles/fractal-rice/waybar-style.css;
    ".config/hypr/hyprland.conf".source = ./dotfiles/fractal-rice/hyprland.conf;
    ".config/wofi/config".source = ./dotfiles/fractal-rice/wofi-config;
    ".config/wofi/style.css".source = ./dotfiles/fractal-rice/wofi-style.css;
    
    ".config/pcmanfm/default/pcmanfm.conf".source = ./dotfiles/fractal-rice/pcmanfm.conf;
   
    #configure mpv to use nvidia playback
    ".config/mpv/mpv.conf".text = ''
	vo=gpu
	gpu-api=opengl
	gpu-context=wayland
	hwdec=nvdec
    '';

  };

  #environment variables 
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  #let home-manager manage itself
  programs.home-manager.enable = true;

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
