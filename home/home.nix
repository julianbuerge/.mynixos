{ config, pkgs, username, ... }:

let 

#choose the rice here. The rest is automatic.
rice = "laptop-rice";

#function taking in a dotfile name and returning the right path
dotfile_path = dotfile_name : ./dotfiles/${rice} + "/${dotfile_name}";

in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  #initially installed version. helps the system from ever breaking. never change it.
  home.stateVersion = "25.05";

  imports = [
    #shared base functionality
    ./dotfiles/shared/modify-desktop-entries.nix
    ./dotfiles/shared/firefox-bookmarks.nix
    ./dotfiles/shared/nvf-base.nix

    #rice specific modules
    (dotfile_path "gtk.nix")
    (dotfile_path "nvf-theme.nix")
  ];

  home.file = {

    #source the config files that we have in the original format
    #(so that we could use a different OS and package manager in the future)
    
    #shared #shared base functionality
    ".config/mpv/mpv.conf".source = ./dotfiles/shared/mpv.conf;  #edit to make sure mpv uses nvidia for decoding (or does not)
    ".config/yazi/yazi.toml".source = ./dotfiles/shared/yazi.toml;
    ".config/yazi/keymap.toml".source = ./dotfiles/shared/yazi-keymap.toml;

    #rice specific dotfiles
    ".config/kitty/kitty.conf".source = (dotfile_path "kitty.conf");
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
