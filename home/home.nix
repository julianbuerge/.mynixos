{ config, pkgs, ... }:

{
  home.username = "julian";
  home.homeDirectory = "/home/julian";

  #initially installed version. helps the system from ever breaking. never change it.
  home.stateVersion = "25.05";

  imports = [
    ./dotfiles/fractal-rice/gtk.nix
    ./dotfiles/shared/modify-desktop-entries.nix
    ./dotfiles/shared/firefox-bookmarks.nix
  ];

  home.file = {

    #source the config files that we have in the original format
    #(so that we could use a different OS and package manager in the future)
    ".config/kitty/kitty.conf".source = ./dotfiles/fractal-rice/kitty.conf;
    ".config/waybar/config".source = ./dotfiles/fractal-rice/waybar-config;
    ".config/waybar/style.css".source = ./dotfiles/fractal-rice/waybar-style.css;
    ".config/hypr/hyprland.conf".source = ./dotfiles/fractal-rice/hyprland.conf;
    ".config/wofi/config".source = ./dotfiles/fractal-rice/wofi-config;
    ".config/wofi/style.css".source = ./dotfiles/fractal-rice/wofi-style.css;
    ".config/yazi/yazi.toml".source = ./dotfiles/shared/yazi.toml;
    ".config/yazi/theme.toml".source = ./dotfiles/fractal-rice/yazi-theme.toml;
    ".config/yazi/keymap.toml".source = ./dotfiles/shared/yazi-keymap.toml;
    
    #configure mpv to use nvidia playback
    ".config/mpv/mpv.conf".text = ''
	vo=gpu
	gpu-api=opengl
	gpu-context=wayland
	hwdec=nvdec
    '';

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
