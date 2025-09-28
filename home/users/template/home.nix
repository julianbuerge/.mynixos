{ config, pkgs, variables, ... }:

let 

#choose the rice here. The rest is automatic.
rice = variables.rice;

#function taking in a dotfile name and returning the right path
dotfile_path = dotfile_name : ../../dotfiles/${rice} + "/${dotfile_name}";


#look at use_nvidia (boolean) to install the right mpv config
mpv_config_path = if variables.configure_with_nvidia then
    ../../dotfiles/shared/mpv/mpv-nvidia.conf else
    ../../dotfiles/shared/mpv/mpv-cpu.conf;

in
{
  home.username = variables.username;
  home.homeDirectory = "/home/${variables.username}";

  #initially installed version. helps the system from ever breaking. never change it.
  home.stateVersion = "25.05";

  imports = [
    #shared base functionality
    ../../dotfiles/shared/neovim-nvf/nvf-base.nix
    ../../dotfiles/shared/git.nix
    ../../dotfiles/shared/shell/bash.nix
    ../../dotfiles/shared/shell/starship.nix
    ../../dotfiles/shared/modify-desktop-entries.nix
    ../../dotfiles/shared/firefox-bookmarks.nix

    #rice specific modules
    (dotfile_path "fonts.nix")
    (dotfile_path "gtk.nix")
    (dotfile_path "nvf-theme.nix")
  ];

  #source the config files that we have in the original format
  # (so that we could use a different OS and package manager in the future)
  home.file = {

    #shared #shared base functionality
    ".config/mpv/mpv.conf".source = mpv_config_path;
    ".config/yazi/yazi.toml".source = ../../dotfiles/shared/yazi/yazi.toml;
    ".config/yazi/keymap.toml".source = ../../dotfiles/shared/yazi/yazi-keymap.toml;

    #rice specific dotfiles
    ".config/kitty/kitty.conf".source = (dotfile_path "kitty.conf");
    ".config/starship.toml".source = (dotfile_path "starship.toml");
    ".config/waybar/config".source = (dotfile_path "waybar-config");
    ".config/waybar/style.css".source = (dotfile_path "waybar-style.css");
    ".config/hypr/hyprland.conf".source = (dotfile_path "hyprland.conf");
    ".config/wofi/config".source = (dotfile_path "wofi-config");
    ".config/wofi/style.css".source = (dotfile_path "wofi-style.css");
    ".config/yazi/theme.toml".source = (dotfile_path "yazi-theme.toml");
    
  };

  #let home-manager manage itself
  programs.home-manager.enable = true;

}
