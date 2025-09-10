{ config, pkgs, ... }:

{
  home.username = "julian";
  home.homeDirectory = "/home/julian";

  #initially installed version. helps the system from ever breaking. never change it.
  home.stateVersion = "25.05";

  imports = [
    #shared base functionality
    ./dotfiles/shared/modify-desktop-entries.nix
    ./dotfiles/shared/firefox-bookmarks.nix
    ./dotfiles/shared/nvf-base.nix

    #rice specific modules
    ./dotfiles/fractal-rice/gtk.nix
    ./dotfiles/fractal-rice/nvf-theme.nix
  ];

  home.file = {

    #source the config files that we have in the original format
    #(so that we could use a different OS and package manager in the future)
    
    #shared #shared base functionality
    ".config/mpv/mpv.conf".source = ./dotfiles/shared/mpv.conf;  #edit to make sure mpv uses nvidia for decoding (or does not)
    ".config/yazi/yazi.toml".source = ./dotfiles/shared/yazi.toml;
    ".config/yazi/keymap.toml".source = ./dotfiles/shared/yazi-keymap.toml;

    #rice specific dotfiles
    ".config/kitty/kitty.conf".source = ./dotfiles/fractal-rice/kitty.conf;
    ".config/waybar/config".source = ./dotfiles/fractal-rice/waybar-config;
    ".config/waybar/style.css".source = ./dotfiles/fractal-rice/waybar-style.css;
    ".config/hypr/hyprland.conf".source = ./dotfiles/fractal-rice/hyprland.conf;
    ".config/wofi/config".source = ./dotfiles/fractal-rice/wofi-config;
    ".config/wofi/style.css".source = ./dotfiles/fractal-rice/wofi-style.css;
    ".config/yazi/theme.toml".source = ./dotfiles/fractal-rice/yazi-theme.toml;
    
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
