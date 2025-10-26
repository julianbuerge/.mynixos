{
  config,
  pkgs,
  variables,
  ...
}: let
  modulepath = modulename: ../../modules/${modulename};
in {
  home.username = variables.username;
  home.homeDirectory = "/home/${variables.username}";

  #let home-manager manage itself
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";

  imports = [
    #coding
    (modulepath "git.nix")

    #terminal
    (modulepath "kitty.nix")
    ../../modules/neovim-nvf.nix
    ../../modules/starship.nix
    ../../modules/bash.nix

    #graphical environment
    ../../modules/hyprland.nix
    ../../modules/gtk.nix
    ../../modules/wofi.nix
    (modulepath "waybar.nix")
    ../../modules/modify-desktop-entries.nix
    ../../modules/fonts.nix

    #applications
    ../../modules/yazi.nix
    ../../modules/firefox-bookmarks.nix
    ../../modules/mpv.nix
  ];
}
